#!/usr/bin/ruby

require 'json'

# domain keys

$domain_keys = [
 {
  :id => 8,
  :flags => 257,
  :active => true,
  :content => "Private-key-format: v1.2
Algorithm: 8 (RSASHA256)
Modulus: nFfl3jgFE+KET9PFPVmRCVmGZ+o+Stnqq7AZPAmhSYf96BPqK3t22vKHJhmVla+td94if2XUSggRUDz8YSeIybVNDTCmhF4xNyhAYAeh+HxJQU7CL8jQLs0b86Hd/Ua/s2pmSFSX4vzoAg+1lucLT3AiGYWjrvciFFpWnMyYftqcfTy3Vu/TMA9Kr7tr75CsJ2mzu1rywHsvOErCY8xH6dGd2LCY9ozuOwsgAlou+rOF5W71UPIuomM9QcIdVD2nq8+aHSsKeWk8gabLEsKU0SFFutO/R41lYXiUaFv+zY7r7NmP+d0Wmr0rgnzq2vlV0USQhlDPAsPSVstAuMrjgw==
PublicExponent: AQAB
PrivateExponent: kSdnrMbKe7dqfcpDG9WMgYp6BS88A5/a2F2ysv+Ds+Q9cAENXTpPn2yNDd4+sd3pgcmYsjsS6deTr9/YFRXw9bKBKLI80JFdZhKng5hMvYqnBGQmt/Dz4/RE87PVLNIC4/mrFE4Bn2vStnRTu3WY/wURXf3YkgI+IdXsfQTsBNloLiRoVV1QmB4kkHtRXsr02dg4kMhaXA13kT7lsrquCvGoxP++keVJ88AaQA8si30/E+CSgrbCHThUXeL6ErYz6myI5O2RJqodlcEQeXYi2cNkzQJnO3yjXcaSJy2u3tVNE2wXCXf1pwHXyTA4YT1qMbMIABq9TiVW8Q2Kg4sN
Prime1: wrNo1cyyL/LpO+Das2EQzMbX0ctdy0OPvg3kWZqt2ZEwJjcVe1Vav5ZzSWKQWuT0IytUst7qdTE7lKpWWKDAbxJ4IMcMiMN2iQqE9V/dhIJluIrshupQzdhnXR46MfbazkDuvMTM1Fk4ZOgm3lrJoRvl6EOxl7e9veTwCjKqrA8=
Prime2: zZDvTPq/Ea7aKa+CNmP7oOYxpvE1fpPV8MRjQ+IMi8VIDHpE72NoSSVoVuSL7fgl7qAFlbJMEtQGIlqUFQkC0sbI6ddb1/Ane+xhH4aPaljtIJQs0GlM/ECz30qZCreyHqaVzXlk9ZrN7HlnIOQ//DV3lCsS8EE1djeQxFThrU0=
Exponent1: S9uW1uX/7sqXsKq0yvrgjshSQf0YOB/Em2nSNE8duQzmU51Wk0z4JHk7xbXPRHq73A//2gkcFDjwW8XaCoHnN99cSnkDGy38uvwMPYXySrR7aWFHMnGMtgbAjvk990WUjpOh8I5Et99jJ32D11JMCKdT9iCZyuDd3mSaWX7QHGU=
Exponent2: hiaslG8a3B5gz01zS62KHCG9i3XkdDtkJeDz6uwNRfW0JDhy3krgVsPryLETxHPpxUV2/49A6BSoACledC/SQN1rZnedv1lBWzUS2PEGjN+FuHoamNPvYruS5wiWwZDJ1AjgwBwVz9Z7xnQf4i4yt5Po+q/1hwb3LbPrbMT8Fg0=
Coefficient: zZDvTPq/Ea7aKa+CNmP7oOYxpvE1fpPV8MRjQ+IMi8VIDHpE72NoSSVoVuSL7fgl7qAFlbJMEtQGIlqUFQkC0sbI6ddb1/Ane+xhH4aPaljtIJQs0GlM/ECz30qZCreyHqaVzXlk9ZrN7HlnIOQ//DV3lCsS8EE1djeQxFThrU0="
 },
 {
   :id => 9,
   :flags => 256,
   :active => true,
   :content => "Private-key-format: v1.2
Algorithm: 8 (RSASHA256)
Modulus: 0fcOKzIHcE5K3B3zwu0iAm4Z/cRBH9JX0mMhl9h58i0C8QEK3fK+425MEI/q4P7qGkwB9hJ9TefC5ny3b+F2iSIDTqcrMoRr6/lJO2YH7MyeuAv1T5HMsC7DoCkdaq0xuoOkOtKaVz5/FwSFmCIlCNeboFX3Fq4kCoWsa1m63AE=
PublicExponent: AQAB
PrivateExponent: BWc0q6LlcxvorEJvD/CXQ/W+YHvo6x84GFdpuWUeOj+zSC1tMKn7BJJFjdWOR0z4DEYxdLokFFmm99R0ygHE0ZWh7WS1OX5AzqoFczeC0BDLvoAYu6XMvwlYp78ffqlI2qv4ohfew5TYzWCugxIufFsC55i2FoworGBLSFUloaM=
Prime1: +aIMyvDUAzL/JZDHsPLnawLhy7sfZB4BbtARAYxZ6HSE9MAnFKbQhXQ9yRdGLSZEhe8g5b9tXBvxT8TPIGhwcw==
Prime2: 11H/gYNtYkloQuRcL2xd3ElxosgncgFvXKY0y4sGyJuEhHJfttaxXCmNfVN9fg5lX18kfxCv4s8rqI+M+rZouw==
Exponent1: SmrNp34NpfqA52D2tsBizproVwSsgfsT8EXkm/KMJuj9bb0OqXBlPzN868Kdb/41dTvpMbRUVJ4b3OzN1lpsEw==
Exponent2: zPRiTzd48SuKsNGJ5iIynbLTFe2LjntLM1eJvY2SYXWXCDOOZA2sOVvcMEU+mLS/Ta7UoJaTtUMZ/ZLW0Pa8bQ==
Coefficient: 11H/gYNtYkloQuRcL2xd3ElxosgncgFvXKY0y4sGyJuEhHJfttaxXCmNfVN9fg5lX18kfxCv4s8rqI+M+rZouw=="
 },
 {
   :id => 10,
   :flags => 256,
   :active => false,
   :content => "Private-key-format: v1.2
Algorithm: 8 (RSASHA256)
Modulus: rzJLZNmV+xQLkYWT3PytSYDeE8SovXi9+WCp9MVkWcSj1BgrBbugregqsSQLvz+rGsgc2nK3kqygDhypRMExmd2TRHeIrtcLHZ3nq+mmL/GfE0K6KWS2FJx06ol7v9xG8esLe+TUSAENo2xFR0BFmkiJN+R5hq06Rb0Y7OMSBs8=
PublicExponent: AQAB
PrivateExponent: FwH6jMABG6bCQ4DQrlDbS6/felEf/TdXcOHqRU7houMEG4fLqUZpZO1Rzfmh4U0x4fktxjJn5pyXrcLDKAMHHv+DjtPSC4B+49HFOZEHl/522VYw6NyJ+Firk41hbFxIStSFYh47qxKyAwbI/LuyTJE0Au8D+4dl8oFwfh0x+aE=
Prime1: 0sDZukxVtL4zI9JPvEdBUAXLu4I98GS7xhxiLNeb+iF2+Vvw06igV7+CccMldz/r3gqr9y+NdAloErFvkieLRQ==
Prime2: 1M822AT25uYwdKiiYuBPQlUIKVuP1paa8y4rh+uDuoHpm9E29hwHr2uLXESOO5YxB0oc8yauNOdH+HGTg8GhAw==
Exponent1: IOq2Fv7tM/mxCxtCEOogLVt6YqMJAY76NQsh2lciqYKojnHpv2VLBemHejU8mM+HC3snOMhYk5MUijbkcjNy8Q==
Exponent2: V0LUkUWP3GQ9MEjJtVOXDHMDkrnZxDsjNF4VOXmoHT0SBnOGXupleFfX4DC4RdSzK/MG5elRe53ulAA2Zctq8w==
Coefficient: 1M822AT25uYwdKiiYuBPQlUIKVuP1paa8y4rh+uDuoHpm9E29hwHr2uLXESOO5YxB0oc8yauNOdH+HGTg8GhAw=="
 }
]

def to32(number) 
   number.to_s(32).tr "0123456789abcdefghijklmnopqrstuv", "ybndrfg8ejkmcpqxot1uwisza345h769"
end

def from32(str)
   str.tr("0123456789abcdefghijklmnopqrstuv", "ybndrfg8ejkmcpqxot1uwisza345h769").to_i(32)
end

def rr(qname, qtype, content, ttl, priority = 0, auth = 1)
   {:qname => qname, :qtype => qtype, :content => content, :ttl => ttl, :priority => priority, :auth => auth}
end

def send_result(result, log = nil)
  out = {:result => result}
  out[:log] = log unless log.nil?
  print out.to_json
  print "\n"
end

def send_failure(msg)
  send_result false, [msg]
end

class Handler
   def do_initialize(*args)
     return true
   end

   def do_getbeforeandafternamesabsolute(args)
     qname = args["qname"]
     # assume prefix
     name = qname.gsub(/ /,'');
     open("/home/cmouse/pdns/rev.log", "a") do |f|
     f.puts name
     end
     unhashed = (name.to_i(16)+1).to_s(16).split(//).join ' ';
     if (name.to_i(16) > 0)
        name_b = (name.to_i(16)-1).to_s(16).split(//).join ' ';
     else
        name_b = nil
     end

     if (name == "ffffffffffffffff")
        name_a = nil
     else
        name_a = (name.to_i(16)+1).to_s(16).split(//).join ' ';
     end
     return {:before => name_b, :after => name_a, :unhashed => name}
   end

   def do_getbeforeandafternames(args)
      self.do_getbeforeandafternamesabsolute(args)
   end

   def do_getdomainkeys(args)
      return $domain_keys if args["name"] == "0.0.0.0.0.0.5.0.8.e.6.0.1.0.0.2.ip6.arpa"
      false
   end

   def do_lookup(args)
     qtype = args["qtype"]
     qname = args["qname"]

     if qname[/.ip6.arpa$/]
      if qname == "0.0.0.0.0.0.5.0.8.e.6.0.1.0.0.2.ip6.arpa"
        ret = []
        if (qtype != "SOA")
           ret << rr(qname, "NS", "ns1.songnet.fi",300)
           ret << rr(qname, "NS", "ns2.songnet.fi",300)
           ret << rr(qname, "NS", "ns3.songnet.fi",300)      
        end
        ret << rr(qname,"SOA","ns1.songnet.fi. hostmaster.tdc.fi. 1 28800 7200 1209600 300",300)
        return ret
      elsif qtype == "ANY" or qtype == "PTR"
        # assume prefix
        prefix = "0.0.0.0.0.0.5.0.8.e.6.0.1.0.0.2.ip6.arpa"
        name = qname.gsub(prefix,"").split(".").reverse.join("")
        return false if name.empty?
	name = to32(name.to_i(16))
        return [rr(qname, "PTR", "node-#{name}.dyn.cmouse.fi", 300)]
      end
     end
     false
   end

 
   def do_getdomainmetadata(args) 
      name = args["name"]
      kind = args["kind"]
#      if name == "0.0.0.0.0.0.5.0.8.e.6.0.1.0.0.2.ip6.arpa" and kind == "NSEC3PARAM"
#         return ["1 1 1 ab"]
#      end
      false
   end

   def do_ping
     return "pong"
   end
end

h = Handler.new

STDOUT.sync = true
begin 
  STDIN.each_line do |line|
    # expect json
    input = {}
    line = line.strip
    next if line.empty?
    begin
      input = JSON.parse(line)
      method = "do_#{input["method"].downcase}"
      args = input["parameters"]
      log = nil
      open("/home/cmouse/pdns/rev.log", "a") do |f|
         f.puts method, args
      end
      if h.respond_to?(method.to_sym) == false
         res = false
         log = ["No such method"]
      elsif args.size > 0
         res = h.send(method,args)
      else
         res = h.send(method)
      end
      send_result res, log
    rescue JSON::ParserError
      send_failure "Cannot parse input #{line}"
      next
    end
  end
rescue SystemExit, Interrupt
end