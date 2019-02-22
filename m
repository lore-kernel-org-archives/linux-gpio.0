From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/2] x86: pcengines apuv2 gpio/leds/keys platform driver
Date: Fri, 22 Feb 2019 17:29:00 +0100
Message-ID: <CACRpkdZXPqi-tQkf+JSiVqidj2yuv9X6m3BuEX5DhDR5ifPMCQ@mail.gmail.com>
References: <1550091448-28578-1-git-send-email-info@metux.net>
 <1550181897-2596-1-git-send-email-info@metux.net> <1550181897-2596-3-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550181897-2596-3-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 11:05 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Driver for PCengines APUv2 board's front LEDs and Button,
> which are attached to AMD PCH GPIOs. Due to lack of dedicated
> ACPI entry, detecting the board via DMI.
>
> Cc: linux-gpio@vger.kernel.org
> Cc: linus.walleij@linaro.org
> Cc: bgolaszewski@baylibre.com
> Cc: dvhart@infradead.org
> Cc: andy@infradead.org
> Cc: platform-driver-x86@vger.kernel.org
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied with Andy's review tag.

Yours,
Linus Walleij
