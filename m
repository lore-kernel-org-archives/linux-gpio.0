From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: msm: Add sleep pinctrl state transitions
Date: Mon, 19 Nov 2018 15:12:57 +0100
Message-ID: <CACRpkdZ5OsrECHzTgEHTqt5c6UAUuu5Mjs9MaE92ahfp2w8YoQ@mail.gmail.com>
References: <20181116185853.128207-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116185853.128207-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: evgreen@chromium.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 16, 2018 at 7:59 PM Evan Green <evgreen@chromium.org> wrote:

> Add PM suspend callbacks to the msm core driver that select the
> sleep and default pinctrl states. Then wire those callbacks up
> in the sdm845 driver, for those boards that may have GPIO hogs
> that need to change state during suspend.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v2:
>  - Moved dev_pm_ops structure to pinctrl-msm [Bjorn]

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
