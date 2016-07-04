From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: fix overly long lines
Date: Mon, 4 Jul 2016 22:20:41 +0300
Message-ID: <ca47c1a9-a77b-2180-b6e4-a0425a5985a0@cogentembedded.com>
References: <1748403.xeiuK39ynx@wasted.cogentembedded.com>
 <6941131.ZKfJHhvm82@wasted.cogentembedded.com>
 <CAMuHMdXYLg7nQ1rTHnuTG2-2J1veApAcizA6j_5-UE1jPs2TPA@mail.gmail.com>
 <37b292fe-3a14-62d6-bdc5-7f7e5e93d958@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <37b292fe-3a14-62d6-bdc5-7f7e5e93d958@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On 07/04/2016 10:15 PM, Sergei Shtylyov wrote:

>>> The PORT_GP_CFG_<n>() macros take up more than 80 columns -- and not for
>>> a good reason. Make the header file checkpatch.pl-proof at least in this
>>> respect...
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> But it doesn't apply, due to "pinctrl: sh-pfc: Initial R8A7796 PFC support"
>
>    ... and *still* not merged? Or am I looking at a wrong tree? :-/
>
>> which was submitted one day earlier.
>
>    I don't think that matters... What matters are the order of merges.

   Moreover, I couldn't find this patch in my mail and in the mail archive 
(marc.info) too -- I'm only seeing your comments to that patch. Where can I 
find the patch itself?

MBR, Sergei
