

module.exports = function (grunt) {

  // require('load-grunt-tasks')(grunt); // npm install --save-dev load-grunt-tasks
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');


  // Configure grunt
  grunt.initConfig({
    sass: {
      options: {
        sourceMap: false
      },
      dist: {
        files: {
          'source/css/main.css': 'source/css/main.scss',
          'source/css/breakpoint-test.css': 'source/css/breakpoint-test.scss',
          'source/css/deal-sprites-large.css': 'source/css/deal-sprites-large.scss',
        }
      }
    },

    watch: {
      sass: {
        files: ['**/*.scss'],
        tasks: ['sass'],
        options: {
          spawn: false,
        },
      },
    },

    sprite: {
      deals: {
        src: 'source/img/sprites/source-deals/*.png',
        dest: 'source/img/sprites/spritesheet-deals.png',
        destCss: 'source/css/_sprite-deals.scss',
        algorithm: 'binary-tree',
        // padding: 1,
        cssTemplate: 'source/img/sprites/deal-sprites-large.scss.mustache'
      },
      logos: {
        src: 'source/img/sprites/source-logos/*.png',
        dest: 'source/img/sprites/spritesheet-logos.png',
        destCss: 'source/css/_sprite-logos.scss',
        algorithm: 'binary-tree',
        padding: 2,
        cssTemplate: 'source/img/sprites/sprite-logos.scss.mustache'
      }
    }
  });

  // Load in `grunt-spritesmith`
  grunt.loadNpmTasks('grunt-spritesmith');

  // grunt.registerTask('sass', ['sass']);
};

