From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: imx8mq: Add suspend/resume ops
Date: Thu, 11 Apr 2019 15:27:44 +0200
Message-ID: <CACRpkdbrAtPAUSO0QMQnqifkHsq55iQnvh1PmYYViUBtz47LQA@mail.gmail.com>
References: <1554748702-2368-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554748702-2368-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Sascha Hauer <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Gong <yibin.gong@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 8, 2019 at 8:38 PM Abel Vesa <abel.vesa@nxp.com> wrote:

> To support pinctl hog restore after LPSR resume back,
> add the generic suspend/resume in pinctrl-imx along with the
> generic pm ops to be used by platform specific drivers. Then
> make use of the newly added ops in i.MX8MQ platform specific
> driver.
>
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

This v3 version applied with Dong's ACK.

Yours,
Linus Walleij
