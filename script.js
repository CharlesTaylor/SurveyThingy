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
    var qq =this.q;
    var ques = document.createElement("p");
    ques.innerHTML = this.q;
    console.log(this.q);
    console.log(this.s);
    sect.appendChild(ques);
    this.s.forEach(function(val){
        var ans = document.createElement("p");
        var rdb = document.createElement("input");
        rdb.name =qq ;
        rdb.type ="radio";
        ans.innerHTML = val;
        ans.appendChild(rdb);
        sect.appendChild(ans);
    });
    document.getElementById("q").appendChild(sect);
};

function load(){
    data.forEach(function(val){
        var qqq = new Question(val.q,val.s);
        qqq.print();
    });
}
