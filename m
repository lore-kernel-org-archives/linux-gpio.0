From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ssbi-gpio: fix gpio-hog related boot issues
Date: Fri, 16 Nov 2018 23:14:49 +0100
Message-ID: <CACRpkdbdEkegcMMmwAQdAc=_n7vcu5M1KGx9KfgvFKbk4ZQ12Q@mail.gmail.com>
References: <20181111013411.14153-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111013411.14153-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: masneyb@onstation.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Nov 11, 2018 at 2:34 AM Brian Masney <masneyb@onstation.org> wrote:

> When attempting to setup up a gpio hog, device probing will repeatedly
> fail with -EPROBE_DEFERED errors. It is caused by a circular dependency
> between the gpio and pinctrl frameworks. If the gpio-ranges property is
> present in device tree, then the gpio framework will handle the gpio pin
> registration and eliminate the circular dependency.
>
> See Christian Lamparter's commit a86caa9ba5d7 ("pinctrl: msm: fix
> gpio-hog related boot issues") for a detailed commit message that
> explains the issue in much more detail. The code comment in this commit
> came from Christian's commit.
>
> I did not test this change against any hardware supported by this
> particular driver, however I was able to validate this same fix works
> for pinctrl-spmi-gpio.c using a LG Nexus 5 (hammerhead) phone.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Patch applied.

Yours,
Linus Walleij
