From: Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Subject: gpio: struct gpio_chip.set_multiple\get_multiple
Date: Thu, 10 Jan 2019 23:24:25 +0530
Message-ID: <CAPY=qRTEQYEQYWBFzvZ9iTftuq7Atn1VqF=rJosybzzHpTjbTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0366698047223313775=="
Return-path: <kernelnewbies-bounces@kernelnewbies.org>
List-Unsubscribe: <https://lists.kernelnewbies.org/mailman/options/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies/>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
 <mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Errors-To: kernelnewbies-bounces@kernelnewbies.org
To: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

--===============0366698047223313775==
Content-Type: multipart/alternative; boundary="00000000000092c4c5057f1e45c9"

--00000000000092c4c5057f1e45c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,


struct gpio_chip {

  int (*get_multiple)(struct gpio_chip *chip,unsigned long *mask,
unsigned long *bits);

  void (*set_multiple)(struct gpio_chip *chip,unsigned long *mask,
unsigned long *bits);

}

struct gpio_chip provides set_multiple callback to assign output values for
multiple signals defined by =E2=80=9Cmask=E2=80=9D and similarly it has get=
_multiple
callback to read values for multiple signals defined by =E2=80=9Cmask=E2=80=
=9D and stores
them in =E2=80=9Cbits=E2=80=9D.


 I=E2=80=99m using deprecated sysfs interface (/sys/class/gpio/gpiochipN =
=E2=80=93 v4.4
kernel), in this kernel version I could not find any userspace control to
achieve to output values for multiple PIO=E2=80=99s and similarly to read m=
ultiple
PIO=E2=80=99s. Can someone clarify me on this?


Thanks,

--00000000000092c4c5057f1e45c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#000000" face=3D"Times New=
 Roman" size=3D"3">

</font><p style=3D"line-height:15pt"><span style=3D"color:rgb(34,34,34);fon=
t-family:&quot;Arial&quot;,sans-serif;font-size:10pt">Hi All,<br style=3D"o=
verflow:visible;font-size-adjust:none;font-stretch:normal">
=C2=A0</span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3=
">

</font><p style=3D"background:white;margin:0in 0in 0pt"><span style=3D"colo=
r:rgb(34,34,34);font-family:&quot;Arial&quot;,sans-serif;font-size:10pt">st=
ruct gpio_chip {</span></p><font color=3D"#000000" face=3D"Times New Roman"=
 size=3D"3">

</font><pre style=3D"background:white"><span style=3D"color:rgb(34,34,34);f=
ont-family:&quot;Arial&quot;,sans-serif"><span>=C2=A0 </span>int (*get_mult=
iple)(struct gpio_chip *chip,unsigned long *mask, unsigned long *bits);</sp=
an></pre><pre style=3D"background:white"><span style=3D"color:rgb(34,34,34)=
;font-family:&quot;Arial&quot;,sans-serif"><span>=C2=A0 </span>void (*set_m=
ultiple)(struct gpio_chip *chip,unsigned long *mask, unsigned long *bits);<=
/span></pre><font color=3D"#000000" face=3D"Times New Roman" size=3D"3">

</font><p style=3D"line-height:15pt"><span style=3D"color:rgb(34,34,34);fon=
t-family:&quot;Arial&quot;,sans-serif;font-size:10pt">}</span></p><font col=
or=3D"#000000" face=3D"Times New Roman" size=3D"3">

</font><p style=3D"background:rgb(252,252,252);margin:0in 0in 0pt"><span st=
yle=3D"color:rgb(34,34,34);font-family:&quot;Arial&quot;,sans-serif;font-si=
ze:10pt">struct gpio_chip provides set_multiple callback to assign
output values for multiple signals defined by =E2=80=9Cmask=E2=80=9D and si=
milarly it has get_multiple
callback to read values for multiple signals defined by =E2=80=9Cmask=E2=80=
=9D and stores them
in =E2=80=9Cbits=E2=80=9D.</span></p><p style=3D"background:rgb(252,252,252=
);margin:0in 0in 0pt"><span style=3D"color:rgb(34,34,34);font-family:&quot;=
Arial&quot;,sans-serif;font-size:10pt"></span><br></p><p style=3D"backgroun=
d:rgb(252,252,252);margin:0in 0in 0pt"><span style=3D"color:rgb(34,34,34);f=
ont-family:&quot;Arial&quot;,sans-serif;font-size:10pt">=C2=A0I=E2=80=99m u=
sing </span><span style=3D"color:rgb(34,34,34);font-family:&quot;Arial&quot=
;,sans-serif;font-size:10pt">deprecated sysfs interface (/sys/class/gpio/gp=
iochipN =E2=80=93 v4.4
kernel), in this kernel version I could not find any userspace control to a=
chieve
to </span><span style=3D"color:rgb(34,34,34);font-family:&quot;Arial&quot;,=
sans-serif;font-size:10pt">output values for
multiple PIO=E2=80=99s and similarly to read multiple PIO=E2=80=99s. Can so=
meone clarify me on
this?</span></p><p style=3D"background:rgb(252,252,252);margin:0in 0in 0pt"=
><span style=3D"color:rgb(34,34,34);font-family:&quot;Arial&quot;,sans-seri=
f;font-size:10pt"></span><br></p><p style=3D"background:rgb(252,252,252);ma=
rgin:0in 0in 0pt"><span style=3D"color:rgb(34,34,34);font-family:&quot;Aria=
l&quot;,sans-serif;font-size:10pt">Thanks,</span></p><font color=3D"#000000=
" face=3D"Times New Roman" size=3D"3">

</font></div></div>

--00000000000092c4c5057f1e45c9--


--===============0366698047223313775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernelnewbies mailing list
Kernelnewbies@kernelnewbies.org
https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies

--===============0366698047223313775==--
