From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: sh-pfc: Remove obsolete platform_device_id entries
Date: Fri, 16 Oct 2015 17:06:27 +0200
Message-ID: <CACRpkdYP_NODbDEweLRksiJ9wmVPMewewm7rGiEfRueKCN0KDQ@mail.gmail.com>
References: <1444213720-26770-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1444213720-26770-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2015 at 12:28 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Since the removal of the r8a7778 legacy SoC code in commit
> 4baadb9e05c68962 ("ARM: shmobile: r8a7778: remove obsolete setup code"),
> which is now in arm-soc/for-next, Renesas R-Car Gen1 SoCs are only
> supported in generic DT-only ARM multi-platform builds.
> The driver doesn't need to match platform devices by name anymore, hence
> this series removes the corresponding platform_device_id entries.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Add to your pull request...

Yours,
Linus Walleij
