From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] [v3] pinctrl: qcom: disable GPIO groups with no pins
Date: Mon, 31 Jul 2017 15:36:55 +0200
Message-ID: <CACRpkdZj+tnMcEpic6PrQS-qMJDodmc_uFJVudxc=USCTXpyKg@mail.gmail.com>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org> <1501179565-26466-3-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1501179565-26466-3-git-send-email-timur@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2017 at 8:19 PM, Timur Tabi <timur@codeaurora.org> wrote:

> To support sparse GPIO maps, pinctrl-msm client drivers can specify
> that a given GPIO has a pin count of zero.  These GPIOs will be
> considered "hidden".  Any attempt to claim the GPIO will fail, and they
> will not be listed in debugfs.
>
> During a kexec shutdown, machine_kexec_mask_interrupts() will attempt
> to disable all IRQs, even those that aren't enabled.  This includes
> GPIOs that are unavailable (npins =3D=3D 0), so add a check to the irq ma=
sk
> and unmask functions.
>
> Signed-off-by: Timur Tabi <timur@codeaurora.org>

I'm waiting for Bj=C3=B6rn's review of the two remaining patches.

Yours,
Linus Walleij
