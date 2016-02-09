/**
 * Created by Fatih on 09/02/2016.
 */





function Question(question,selections,id){
    this.q = question;
    this.s = selections;
    this.id = id;
    console.log(this.q);
    console.log(this.s)
}
//TODO Handle Submit
Question.prototype.print = function(){
    var sect = document.createElement("section");
    var qq =this.q;
    var id = this.id;
    var ques = document.createElement("p");
    ques.innerHTML = this.q;
    console.log(this.q);
    console.log(this.s);
    sect.appendChild(ques);
    this.s.forEach(function(val){
        var ans = document.createElement("p");//TODO Instead create a div and put both in
        var rdb = document.createElement("input");
        rdb.name =id ;//TODO Instead use an ID system to name buttons
        rdb.type ="radio";
        ans.innerHTML = val;
        ans.appendChild(rdb);
        sect.appendChild(ans);
    });
    document.getElementById("q").appendChild(sect);
};

function load(){

    function loadJSON(callback) {

        var xobj = new XMLHttpRequest();
        xobj.overrideMimeType("application/json");
        xobj.open('GET', 'data.json', true); // Replace 'my_data' with the path to your file
        xobj.onreadystatechange = function () {
            if (xobj.readyState == 4 && xobj.status == "200") {
                // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
                callback(xobj.responseText);
            }
        };
        xobj.send(null);
    }

    loadJSON(function(response) {
        // Parse JSON string into object
        var mdata = JSON.parse(response);

        var arr = Object.keys(mdata).map(function(k) { return mdata[k] });
        console.log(arr);
        var count = 0;
        arr.forEach(function(val){
            var qqq = new Question(val.q,val.s,count);
            qqq.print();
            count++;
        });
    });


}
