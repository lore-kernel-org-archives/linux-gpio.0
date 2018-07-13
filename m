From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: at91-pio4: remove redundant return value
 check of platform_get_resource()
Date: Fri, 13 Jul 2018 09:43:48 +0200
Message-ID: <CACRpkdb7zWv10Fnr_M4zSKmhHQ=QmJTOAJsqgCPguAdCuU=4iA@mail.gmail.com>
References: <1531312447-134423-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531312447-134423-1-git-send-email-weiyongjun1@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 11, 2018 at 2:25 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
