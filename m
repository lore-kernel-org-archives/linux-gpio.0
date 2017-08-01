From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH/RFC] gpio: rcar: add gen[123] fallback compatibility strings
Date: Tue, 1 Aug 2017 10:27:40 +0200
Message-ID: <CACRpkdakMcmgELYdQBBy3F2FFEkEmaHJL2QuNNc236wHug6ctA@mail.gmail.com>
References: <1499776710-25450-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499776710-25450-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 11, 2017 at 2:38 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:

> Add fallback compatibility string for R-Car Gen 1, 2 and 3.
>
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, f.e. Gen 1 and 2. But beyond that its not clear what the relationship
> between IP blocks might be. For example, I believe that r8a7790 is older
> than r8a7791 but that doesn't imply that the latter is a descendant of the
> former or vice versa.
>
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
>
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
>
> Also deprecate renesas,gpio-rcar as its name is more generic than its
> implementation.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Totally uncontroversial DT binding changes so patch applied for next
with Geert's review tag.

Yours,
Linus Walleij
