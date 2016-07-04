From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"
Date: Mon, 4 Jul 2016 15:16:40 +0200
Message-ID: <CACRpkdYZCO9vaegXWVtbRB9pF3294FxZR3XseyXNMiHcTKZUSw@mail.gmail.com>
References: <1467563525-30227-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467563525-30227-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jul 3, 2016 at 6:32 PM, Johan Hovold <johan@kernel.org> wrote:

> This reverts commit 923b93e451db876d1479d3e4458fce14fec31d1c.

Laurent, can we have you comment on this?

Getting close to v4.7 final so we need to quickly see if
this is the solution or if it will cause further regressions on
your side if I revert it...

Yours,
Linus Walleij
