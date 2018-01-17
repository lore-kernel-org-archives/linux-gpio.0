From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/2] pinctrl: meson: use one uniform 'function' name
Date: Tue, 16 Jan 2018 16:14:55 -0800
Message-ID: <7h4lnlcpds.fsf@baylibre.com>
References: <20180108073328.205769-1-yixun.lan@amlogic.com>
        <1515401544.5048.67.camel@baylibre.com>
        <a6a4ed23-696c-ae2d-9b6a-c2578372b1aa@amlogic.com>
        <1515569324.5048.103.camel@baylibre.com>
        <9a27021f-acfc-a010-8ea1-a1bc8f076b6e@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9a27021f-acfc-a010-8ea1-a1bc8f076b6e@amlogic.com> (Yixun Lan's
        message of "Wed, 10 Jan 2018 20:00:29 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>
List-Id: linux-gpio@vger.kernel.org

Yixun Lan <yixun.lan@amlogic.com> writes:

> Hi Jerome:
>
> On 01/10/2018 03:28 PM, Jerome Brunet wrote:
>> On Wed, 2018-01-10 at 10:12 +0800, Yixun Lan wrote:
>>>
>>> On 01/08/18 16:52, Jerome Brunet wrote:
>>>> On Mon, 2018-01-08 at 15:33 +0800, Yixun Lan wrote:
>>>>> These two patches are general improvement for meson pinctrl driver.
>>>>> It make the two pinctrl trees (ee/ao) to share one uniform 'function'=
 name for
>>>>> one hardware block even its pin groups live inside two differet hardw=
are domains,
>>>>> which for example EE vs AO domain here.
>>>>>
>>>>> This idea is motivated by Martin's question at [1]
>>>>>
>>>>> [1]
>>>>>  http://lkml.kernel.org/r/CAFBinCCuQ-NK747+GHDkhZty_UMMgzCYOYFcNTrRDJ=
gU8OM=3DGw@mail.gmail.com
>>>>>
>>>>>
>>>>> Yixun Lan (2):
>>>>>   pinctrl: meson: introduce a macro to have name/groups seperated
>>>>>   pinctrl: meson-axg: correct the pin expansion of UART_AO_B
>>>>>
>>>>>  drivers/pinctrl/meson/pinctrl-meson-axg.c | 4 ++--
>>>>>  drivers/pinctrl/meson/pinctrl-meson.h     | 8 +++++---
>>>>>  2 files changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> Hi Yixun,
>>>>
>>>> Honestly, I don't like the idea. I think it adds an unnecessary comple=
xity.
>>>> I don't see the point of FUNCTION_EX(uart_ao_b, _z) when you could sim=
ply write=20
>>>> FUNCTION(uart_ao_b_z) ... especially when there is just a couple of fu=
nction per
>>>> SoC available on different domains.
>>>>
>>>> A pinctrl driver can already be challenging to understand at first, le=
t's keep
>>>> it simple and avoid adding more macros.
>>>>
>>>
>>> Hi Jerome=EF=BC=9A
>>>   In my opinion, the idea of keeping one uniform 'function' in DT (thus
>>> introducing another macro) is worth considering. It would make the DT
>>> part much clean.
>>=20
>> Ok this is your opinion. I don't share it. Keeping function names tidy i=
s good,
>> I don't think we need another macro to do so.
>>=20
>>>   And yes, it's a trade-off here, either we 1) do more in code to make
>>> DT clean or 2) do nothing in the code level to make DT live with it.
>>=20
>> I don't see how adding a macro doing just string concatenation is going =
to make
>> anything more clean. It does not prevent one to write FUNCTION_EX(uart_a=
o_b,
>> _gpioz), resulting in uart_ao_b_gpioz, which is what is apparently consi=
dered
>> 'not clean'
>>=20
> for the benefits of introducing macro 'FUNCTION_EX', it will end with
>  .name =3D "uart_ao_b", -> same for both EE, AO domain, and it will match
> the DT part (although still different for '.groups')
>
>
>> BTW, there no cleanness issue here, the name is just out of the 'usual s=
cheme'
>> but there is no problem with. If you want to change this, and
>> s/uart_ao_b_gpioz/uart_ao_b_z/, now is the time to change it.=20
>>=20
> I'd rather *NOT* to push a pinctrl patch for just changing
> 'uart_ao_b_gpioz' to 'uart_ao_b_z' (it's a cosmetic change, and still
> end with two different name - 'uart_ao_b_gpioz/z' & 'uart_ao_b' in DT)

FWIW, I agree with Jerome.

Rather than this patch adding a(nother) hard-to-understand macro, please
submit a pinctrl rename/cleanup to s/uart_ao_b_gpioz/uart_ao_b_z/.
Since there are not any users of the _gpioz name, now is the time to do
it.

We're already using the _x _y _z suffixes all over the place, and IMO,
adding this new macro would make that even more confusing that it
already is.

Kevin
