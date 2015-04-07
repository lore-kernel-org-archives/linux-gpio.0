From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] pinctrl: at91: convert __raw to endian agnostic IO
Date: Tue, 7 Apr 2015 19:49:02 +0800
Message-ID: <A0B30D6A-11E5-4D5D-AA0F-9AC807431459@jcrosoft.com>
References: <1427372329-26005-1-git-send-email-ben.dooks@codethink.co.uk>
 <CACRpkdY26txvV92SePv02EdX6TOcTBn9uWPX08gC2oAi7XGs0A@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdY26txvV92SePv02EdX6TOcTBn9uWPX08gC2oAi7XGs0A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@lists.codethink.co.uk, Nicolas FERRE <nicolas.ferre@atmel.com>, "open list:PIN CONTROL SUBSY..." <linux-gpio@vger.kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, "moderated list:PIN CONTROLLER -..." <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org


> On Apr 7, 2015, at 5:06 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> On Thu, Mar 26, 2015 at 1:18 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> 
>> Use endian agnostic _relaxed IO accessors instead of the __raw ones.
>> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> Uncontroversial. Applied with Nicolas' ACK.
I ack the whole series so yes

Best Regards,
J.
