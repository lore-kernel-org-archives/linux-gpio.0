From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/2] [v2] pinctrl: qcom: qdf2xxx: expose only some GPIO pins
Date: Mon, 3 Jul 2017 16:21:42 -0400
Message-ID: <9BA42EA1-D050-41D3-A7DE-0B0FBF9A4274@codeaurora.org>
References: <1498783339-749-1-git-send-email-timur@codeaurora.org> <1498783339-749-2-git-send-email-timur@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50456 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751479AbdGCUVq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2017 16:21:46 -0400
In-Reply-To: <1498783339-749-2-git-send-email-timur@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Jun 29, 2017, at 8:42 PM, Timur Tabi wrote:

> On Qualcomm Technologies QDF2xxx platforms, only a subset of the GPIOs
> are actually available to the HLOS.  The others are blocked by the =
XPU,
> and any attempt to access them will cause an XPU violation that halts
> the system.
>=20
> Instead, the ACPI table now lists only specific GPIOs that are exposed
> externally as generic GPIO pins.  The full list of GPIOs is still
> registered, but the pin count for the unavailable GPIOs is set to =
zero.
> The pinctrl-msm driver will block those unavailable GPIOs from being
> accessed.

Please do not apply this patchset just yet. =20

We are considering assigning a new ACPI HID for this change, so that we =
don't accidentally cause XPU violations when someone uses an old kernel =
with new firmware.  However, with everyone on vacation this week, many =
of the stakeholders are not available for discussions.

I'm still interested in reviews on this patchset though.

