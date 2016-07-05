From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
Date: Tue, 5 Jul 2016 17:46:06 +0200
Message-ID: <CAMuHMdXWJVBt7=b46cyz_Gzh4QQDDPGa72HoXupNvR9NCc03tA@mail.gmail.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <1734030.FmmGtJt7OA@wasted.cogentembedded.com>
 <CAMuHMdX9bxt9W_0NxPZn5Hi9314rBuDnecvL2TfqrwKm6r0q6g@mail.gmail.com> <CACRpkdb3QSU_6HJR8kLtQ5t4wnH7mkAs-C=Mxz+suggDW+UxYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb3QSU_6HJR8kLtQ5t4wnH7mkAs-C=Mxz+suggDW+UxYQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, Jul 5, 2016 at 4:54 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jul 5, 2016 at 8:57 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Hi Sergei,
>>
>> On Mon, Jul 4, 2016 at 9:52 PM, Sergei Shtylyov
>> <sergei.shtylyov@cogentembedded.com> wrote:
>>> Add the EtherAVB pin groups to the R8A7792 PFC driver.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Should I just apply it?
>
> It's late in the kernel cycle but I do not mind stuff like
> this so much.

You can't, as I haven't send a pull request for the initial r8a7792 support yet,
so this patch won't apply ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
