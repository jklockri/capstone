/* global Vue,$, gon*/

document.addEventListener("DOMContentLoaded", function(event) { 
  // var app0 = new Vue({
  //   el: '#app0',
  //   data: {}
  // });

  var app = new Vue({
    el: '#app',
    data: {
      bets: [],
      amountFilter:'',
      firstUserFilter:'',
      secondUserFilter:'',
      judgeFilter:'',
      currentUser: gon.current_user


    },

    mounted: function() {
      $.get('/api/v1/bets', function(responseData) {
        this.bets = responseData;
        console.log(gon.current_user);
      }.bind(this));
    },

    computed: {
      modifiedBets: function() {
        return this.bets.filter(function(bet) {
          return bet.amount.indexOf(this.amountFilter) !== -1 && 
          bet.first_user.name.toLowerCase().indexOf(this.firstUserFilter.toLowerCase()) !== -1 && 
          bet.second_user.name.toLowerCase().indexOf(this.secondUserFilter.toLowerCase()) !== -1 && 
          bet.master_judge.name.toLowerCase().indexOf(this.judgeFilter.toLowerCase()) !== -1; 
        }.bind(this));
      }
    },


    methods: {
      showJudge: function() { 
        var judged = [];
        for (var i = 0; i < this.bets.length; i++) {
          if (this.bets[i].master_judge === this.currentUser) {
            judged.push(this.bet[i]);
          }
        }
        this.bets = judged;
      }
    }
      


  });
});

$('#calendar').fullCalendar({});




