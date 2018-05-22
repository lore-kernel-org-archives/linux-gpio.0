From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3] gpio: mxc: add clock operation
Date: Tue, 22 May 2018 08:23:54 -0300
Message-ID: <CAOMZO5Ccqsg_1rr=VACXL+bfOOB+G+XMPVhGH3G5U8tHoq9sNw@mail.gmail.com>
References: <1526958340-25883-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526958340-25883-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 22, 2018 at 12:05 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> Some i.MX SoCs have GPIO clock gates in CCM CCGR, such as
> i.MX6SLL, need to enable clocks before accessing GPIO
> registers, add optional clock operation for GPIO driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
