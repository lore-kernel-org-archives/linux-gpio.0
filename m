From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: xway: fix gpio-hog related boot issues
Date: Mon, 17 Dec 2018 15:32:51 +0100
Message-ID: <CACRpkdaTR-Bb6MBtP34GCEtjqfxSNr5PQjDZ_PFqX2B+odGu-w@mail.gmail.com>
References: <20181214074825.6976-1-ms@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214074825.6976-1-ms@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schiller <ms@dev.tdt.de>, John Crispin <john@phrozen.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 14, 2018 at 8:48 AM Martin Schiller <ms@dev.tdt.de> wrote:

> This patch is based on commit a86caa9ba5d7 ("pinctrl: msm: fix gpio-hog
> related boot issues").
>
> It fixes the issue that the gpio ranges needs to be defined before
> gpiochip_add().
>
> Therefore, we also have to swap the order of registering the pinctrl
> driver and registering the gpio chip.
>
> You also have to add the "gpio-ranges" property to the pinctrl device
> node to get it finally working.
>
> Signed-off-by: Martin Schiller <ms@dev.tdt.de>

Patch applied unless John Crispin has objections, it looks
good to me!

Yours,
Linus Walleij
