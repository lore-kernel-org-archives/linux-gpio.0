From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7794: add EtherAVB pin groups
Date: Thu, 18 Feb 2016 20:40:20 +0300
Message-ID: <56C60204.9080902@cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <3010555.FcVIno0yOe@wasted.cogentembedded.com>
 <CAMuHMdVdqYJ8S0Vps9B8+L_nApaXFrE9M82iDb6_iWjAfXHCVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVdqYJ8S0Vps9B8+L_nApaXFrE9M82iDb6_iWjAfXHCVA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hello.

On 02/18/2016 11:36 AM, Geert Uytterhoeven wrote:

>> Add the EtherAVB pin groups to the R8A7794 PFC driver.
>>
>> Based on the patches by Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>.
>
> Thank you for your patch!
>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> +static const unsigned int avb_avtp_capture_pins[] = {
>> +       RCAR_GP_PIN(5, 11),
>> +};
>> +static const unsigned int avb_avtp_capture_mux[] = {
>> +       AVB_AVTP_CAPTURE_MARK,
>> +};
>> +static const unsigned int avb_avtp_match_pins[] = {
>> +       RCAR_GP_PIN(5, 12),
>> +};
>> +static const unsigned int avb_avtp_match_mux[] = {
>> +       AVB_AVTP_MATCH_MARK,
>> +};
>> +static const unsigned int avb_avtp_capture_b_pins[] = {
>> +       RCAR_GP_PIN(1, 1),
>> +};
>> +static const unsigned int avb_avtp_capture_b_mux[] = {
>> +       AVB_AVTP_CAPTURE_B_MARK,
>> +};
>> +static const unsigned int avb_avtp_match_b_pins[] = {
>> +       RCAR_GP_PIN(1, 2),
>> +};
>> +static const unsigned int avb_avtp_match_b_mux[] = {
>> +       AVB_AVTP_MATCH_B_MARK,
>> +};
>
> BTW, the capture pin seems to be available on R-Car E2 only.

    Yes, I've noticed.

> The match pin seems to be available on R-Car E2 and V2H only.

    Don't have V2H manual, have to trust you. :-)

> The EtherAVB section in the datasheet doesn't clarify this.
> Do you know more?

    Unfortunately, no. I only know what AVTP in the pin name probably stands 
for: Audio/Video Transport Protocol.

> Gr{oetje,eeting}s,
>
>                          Geert

MBR, Sergei
