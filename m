From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: mediatek: make symbol 'mtk_drive' static
Date: Fri, 21 Sep 2018 09:03:20 -0700
Message-ID: <CACRpkdb6yYV-KaHUOUXHLsKDYtPNe-bYq7wHGHqqberRzTJcbA@mail.gmail.com>
References: <1537424502-23554-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1537424502-23554-1-git-send-email-weiyongjun1@huawei.com>
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 19, 2018 at 11:12 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fixes the following sparse warning:
>
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:37:29: warning:
>  symbol 'mtk_drive' was not declared. Should it be static?
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied with Sean's ACK.

Yours,
Linus Walleij
