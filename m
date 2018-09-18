From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/22] pinctrl: mediatek: add pinctrl-moore that
 implements the generic pinctrl dt-bindings
Date: Tue, 18 Sep 2018 12:42:09 -0700
Message-ID: <CACRpkdYr+9i+UA477sVp=mQ6oA+b4LqxGUyfTDy0XXN0aW0FMA@mail.gmail.com>
References: <cover.1536404280.git.sean.wang@mediatek.com> <5001a940525e9da7b0e1ac1afead629e1373fe33.1536404280.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5001a940525e9da7b0e1ac1afead629e1373fe33.1536404280.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 8, 2018 at 4:07 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> Add a generic driver pinctrl-moore.c for MT762x SoC and any other SoC
> that would like to use generic dt-binding. The patch is furtherly
> refactored from pinctrl-mt7622.c that totally uses the functions back by
> the generic pinctrl core such as GENERIC_PINCONF, GENERIC_PINCTRL_GROUPS,
> and GENERIC_PINMUX_FUNCTIONS and its binding also completely follows up
> pinctrl-bindings.txt in Documentation/devicetree/bindings/pinctrl/ to
> implement.
>
> Signed-off-by: Ryder.Lee <ryder.lee@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied with some fuzzing, and removing un unused <linux/gpio.h>
include.

Yours,
Linus Walleij
