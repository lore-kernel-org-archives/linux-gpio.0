From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gliolib: request the gpio before querying its direction
Date: Mon, 31 Jul 2017 15:35:19 +0200
Message-ID: <CACRpkdYPBd4ZvuXo__LRQezTQD3u=3r2WO+2dTzBanLL1zX72w@mail.gmail.com>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org> <1501179565-26466-2-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1501179565-26466-2-git-send-email-timur@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2017 at 8:19 PM, Timur Tabi <timur@codeaurora.org> wrote:

> Before querying a GPIO to determine its direction, the GPIO should be
> formally requested.  This allows the GPIO driver to block access to
> unavailable GPIOs, which makes it easier for some drivers to support
> sparse GPIO maps.
>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

This makes all kind of semantic change, so patch applied.

Yours,
Linus Walleij
