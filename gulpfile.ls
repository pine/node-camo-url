require! {
  gulp
  'gulp-util': gutil
  'gulp-rename': rename
  'gulp-livescript': livescript
  'gulp-istanbul': istanbul
  'gulp-mocha': mocha
  'gulp-plumber': plumber
}


gulp.task 'coverage', (cb) !->
  gulp.src <[ lib/**/*.js ]>
    .pipe istanbul( includeUntested: true )
    .pipe istanbul.hookRequire()
    .on 'finish', ->
      gulp.src 'test/**/*.js'
        .pipe mocha( reporter: 'spec', timeout: 10 * 1000 )
        .on 'error', (err) ->
          gutil.log(err)
          @emit('end')
        .pipe istanbul.writeReports()
        .once 'end', ->
          cb()


gulp.task 'livescript', ->
  gulp.src <[ lib/**/*.ls test/**/*.ls ]>
    .pipe plumber()
    .pipe livescript()
    .pipe rename( extname: '.js' )
    .pipe gulp.dest (file) -> file.base


gulp.task 'watch', ->
  gulp.watch <[ lib/**/*.ls test/**/*.ls ]>, <[ livescript ]>
  gulp.watch <[ index.js lib/**/*.js test/**/*/js ]>, <[ coverage ]>


gulp.task 'test', <[ coverage ]>
gulp.task 'default', <[ livescript ]>
