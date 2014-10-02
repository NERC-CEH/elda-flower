module.exports = (grunt) ->
  #Load grunt tasks
  grunt.loadNpmTasks 'grunt-exec'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  #Configure tasks
  grunt.initConfig
    exec:
      git_status: 'git diff --exit-code'
    
    less: 
      development:
        files: 'lda-assets/css/style.css' : 'lda-assets/less/style.less'

    watch:
      less:
        files: "lda-assets/less/*"
        tasks: ["less"]

    clean:
      prep: ['lda-assets/css']

    cssmin:
      build:
        src: 'lda-assets/css/style.css'
        dest: 'lda-assets/css/style.css'

  grunt.registerTask 'bower-install', ->
    require('bower').commands.install().on('end', do @async)

  grunt.registerTask 'prep', ['clean', 'bower-install']
  grunt.registerTask 'develop', ['less', 'watch:less']
  grunt.registerTask 'build', ['clean', 'less', 'cssmin']
  grunt.registerTask 'default', ['prep', 'build', 'exec:git_status']