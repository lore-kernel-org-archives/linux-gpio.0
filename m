From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl: Add MDM9615 TLMM pinctrl driver and bindings
Date: Fri, 17 Jun 2016 22:16:15 +0200
Message-ID: <CACRpkdbCio=a4GX=WTjvD_moENw7G+O6JWHBiCc4F9DsD7=TQQ@mail.gmail.com>
References: <1466158535-17962-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1466158535-17962-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Andy Gross <andy.gross@linaro.org>, Sricharan R <sricharan@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 17, 2016 at 12:15 PM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> In order to support the Qualcomm MDM9615 in the Sierra Wireless WP854=
8
> Modules, add the MDM9615 TLMM pinctrl driver and bindings.
>
> This patchset is part of a global SoC + Module + Board support for th=
e
> Sierra Wireless mangOH Board support with the WP8548 module.
>
> Neil Armstrong (2):
>   pinctrl: qcom: Add support for MDM9615 TLMM
>   dt-bindings: pinctrl: Add MDM9615 TLMM bindings

Nice! But you need to send it to Bj=C3=B6rn Andersson and Ivan Ivanov
(See To: line) for review.

Bj=C3=B6rn, Ivan: can you find the patches or does Neil need to resend =
them?

Yours,
Linus Walleij
