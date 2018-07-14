From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in
 nsp_pinmux_probe()
Date: Sat, 14 Jul 2018 12:49:07 +0200
Message-ID: <CACRpkdaSgwLhwwHEKHJfrWSHcQ+SAZPtkOreP88wtDKuMgTVcg@mail.gmail.com>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
 <CACRpkdbwAJOaFay3x45gyf7rBpkPOAMbxW6FLQUvCekUKatLYA@mail.gmail.com>
 <14329d52-72bb-3594-dec3-00ab0f7ccd40@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <14329d52-72bb-3594-dec3-00ab0f7ccd40@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 13, 2018 at 6:53 PM Ray Jui <ray.jui@broadcom.com> wrote:

> > Patch applied with Ray's ACK.
>
> Would be nice to add the following Fixes tag:
>
> Fixes: cc4fa83f66e9 ("pinctrl: nsp: add pinmux driver support for
> Broadcom NSP SoC")

OK fixed it!

Yours,
Linus Walleij
