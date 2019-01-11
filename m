From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix build errors for moore core when
 CONFIG_OF is not enabled
Date: Fri, 11 Jan 2019 15:25:38 +0100
Message-ID: <CACRpkdaJ29di4GxcHNa+pUtV62aF+8SRKTzYMAJHd-8j0oiX=Q@mail.gmail.com>
References: <64a23e6f8751ee6f1387a611a9d5dba43694b0d0.1546999151.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <64a23e6f8751ee6f1387a611a9d5dba43694b0d0.1546999151.git.ryder.lee@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 9, 2019 at 3:14 AM Ryder Lee <ryder.lee@mediatek.com> wrote:

> on i386 or x86_64:
>
> Lots of build errors for drivers/pinctrl/mediatek/pinctrl-moore.c when
> CONFIG_OF is not enabled (but COMPILE_TEST is).

Patch applied with Seans ACK and trimming down the subject
and commit message a bit :)

Yours,
Linus Walleij
