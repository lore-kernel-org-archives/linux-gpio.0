From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in
 nsp_pinmux_probe()
Date: Fri, 13 Jul 2018 09:53:29 -0700
Message-ID: <14329d52-72bb-3594-dec3-00ab0f7ccd40@broadcom.com>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
 <CACRpkdbwAJOaFay3x45gyf7rBpkPOAMbxW6FLQUvCekUKatLYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbwAJOaFay3x45gyf7rBpkPOAMbxW6FLQUvCekUKatLYA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On 7/13/2018 12:46 AM, Linus Walleij wrote:
> On Wed, Jul 11, 2018 at 2:25 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> 
>> platform_get_resource() may fail and return NULL, so we should
>> better check it's return value to avoid a NULL pointer dereference
>> a bit later in the code.
>>
>> This is detected by Coccinelle semantic patch.
>>
>> @@
>> expression pdev, res, n, t, e, e1, e2;
>> @@
>>
>> res = platform_get_resource(pdev, t, n);
>> + if (!res)
>> +   return -EINVAL;
>> ... when != res == NULL
>> e = devm_ioremap_nocache(e1, res->start, e2);
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Patch applied with Ray's ACK.

Would be nice to add the following Fixes tag:

Fixes: cc4fa83f66e9 ("pinctrl: nsp: add pinmux driver support for 
Broadcom NSP SoC")

Thanks,

Ray

> 
> Yours,
> Linus Walleij
> 
