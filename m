From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND V5 1/1] gpio: vf610: add optional clock support
Date: Fri, 16 Nov 2018 23:10:06 +0100
Message-ID: <CACRpkdb=B2RRTb1J9s=es3nGGUPM5rhugMPWe5Jc761teyOPVw@mail.gmail.com>
References: <1541859384-32301-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1541859384-32301-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 10, 2018 at 3:21 PM A.s. Dong <aisheng.dong@nxp.com> wrote:

> Some SoCs need the gpio clock to be enabled before accessing
> HW registers. This patch add the optional clock handling.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied.

Yours,
Linus Walleij
