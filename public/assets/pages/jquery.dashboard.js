/**
 * Theme: Codefox Dashboard
 * Author: Coderthemes
 * Dashboard
 */

!function($) {
  "use strict";

  var Dashboard = function() {};

  Dashboard.prototype.init = function () {

    //combined chart
    c3.generate({
      bindto: '#combine-chart',
      data: {
        columns: [
          ['Desktop', 600, 92, 50, 40, 60, 50],
          ['Mobiles', 200, 130, 90, 240, 130, 220],
          ['Tablets', 300, 200, 160, 400, 250, 250],
          ['Android', 200, 130, 90, 240, 130, 220],
          ['ios', 130, 120, 150, 140, 160, 150]
        ],
        types: {
          Desktop: 'line',
          Mobiles: 'line',
          Tablets: 'line',
          Android: 'line',
          ios: 'line'
        },
        colors: {
          Desktop: '#1ea69a',
          Mobiles: '#f7531f',
          Tablets: '#8892d6',
          Android: '#45bbe0',
          ios: '#3b3e47'
        }
      },
      axis: {
        x: {
          type: 'categorized'
        }
      }
    });

    //roated chart
    c3.generate({
      bindto: '#roated-chart',
      data: {
        columns: [
          ['data1', 30, 200, 100, 400, 150, 250],
          ['data2', 50, 20, 10, 40, 15, 25]
        ],
        types: {
          data1: 'bar'
        },
        colors: {
          data1: '#1ea69a',
          data2: '#f7531f'
        }
      },
      axis: {
        rotated: true,
        x: {
          type: 'categorized'
        }
      }
    });

    //Donut Chart
    c3.generate({
      bindto: '#donut-chart',
      data: {
        columns: [
          ['Data1', 46],
          ['Data2', 24],
          ['Data3', 48],
          ['Data4', 18]
        ],
        type : 'donut'
      },
      donut: {
        title: "Candidates",
        width: 40,
        label: {
          show:false
        }
      },
      color: {
        pattern: ["#348cd4", "#eee", "#f7531f","#ff9800"]
      }
    });

    //Donut Chart 2
    c3.generate({
      bindto: '#donut-chart2',
      data: {
        columns: [
          ['Data1', 46],
          ['Data2', 24],
          ['Data3', 48],
          ['Data4', 18]
        ],
        type : 'donut'
      },
      donut: {
        title: "Candidates",
        width: 40,
        label: {
          show:false
        }
      },
      color: {
        pattern: ["#348cd4", "#eee", "#f7531f","#ff9800"]
      }
    });
    
  },
      $.Dashboard = new Dashboard, $.Dashboard.Constructor = Dashboard

}(window.jQuery),

//initializing
    function($) {
      "use strict";
      $.Dashboard.init()
    }(window.jQuery);


