From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] pinctrl: msm: Really mask level interrupts to
 prevent latching
Date: Wed, 29 Aug 2018 09:44:14 +0200
Message-ID: <CACRpkdbQ2i1jPe=hodgsAjKtbtiqCX9G5nGhN8YmoRqGAxHGWA@mail.gmail.com>
References: <20180816200648.90458-1-swboyd@chromium.org> <20180816200648.90458-2-swboyd@chromium.org>
 <CACRpkdbGUPpwEbGqg3Q3780DiEG2fts2WRkjkuQ2kmJR1HiftA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbGUPpwEbGqg3Q3780DiEG2fts2WRkjkuQ2kmJR1HiftA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 29, 2018 at 9:40 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> This patch applied for fixes with Doug and Bjorn's ACKs.
>
> I suppose you will respin the two others and obtain buy-in from
> the same people for these.

Scrap that. I saw Bjorn has ACKed the two others so applied them for
next (v4.20).

Yours,
Linus Walleij
