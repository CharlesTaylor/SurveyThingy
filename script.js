/**
 * Created by Fatih on 09/02/2016.
 */





function Question(question,selections){
    this.q = question;
    this.s = selections;
    console.log(this.q);
    console.log(this.s)
}

Question.prototype.print = function(){
    var sect = document.createElement("section");

    var ques = document.createElement("p");
    ques.innerHTML = this.q;
    console.log(this.q);
    console.log(this.s);
    sect.appendChild(ques);
    this.s.forEach(function(val){
        var ans = document.createElement("p");
        var rdb = document.createElement("input");
        rdb.name = "rb";
        rdb.type ="radio";
        ans.innerHTML = val;
        ans.appendChild(rdb);
        sect.appendChild(ans);
    });
    document.getElementById("q").appendChild(sect);
};

function load(){
    var qu ="Is this anket working?";
    var sel = ["Yes","No","FU"];
    var qqq = new Question(qu,sel);
    qqq.print();
}
