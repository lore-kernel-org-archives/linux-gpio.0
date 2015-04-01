From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/2] pinctrl: at91: Add set_multiple GPIO chip feature
Date: Wed, 1 Apr 2015 15:45:20 +0800
Message-ID: <15EE7657-76F1-4AD4-B90B-C6A166301154@jcrosoft.com>
References: <1426878721-2618-1-git-send-email-alexanders83@web.de>
 <CACRpkdapp8vGFHJA+WrZzRk503zoAzrz3HaVGYXH+CHRDaLaDg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdapp8vGFHJA+WrZzRk503zoAzrz3HaVGYXH+CHRDaLaDg@mail.gmail.com>
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
Cc: Alexander Stein <alexanders83@web.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

J
> On Mar 27, 2015, at 5:07 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> On Fri, Mar 20, 2015 at 8:12 PM, Alexander Stein <alexanders83@web.de> wrote:
> 
>> This adds the callback for set_multiple.
>> As this controller has a separate set and clear register, we can't write
>> directly to PIO_ODSR as this would required a cached variable and would
>> race with at91_gpio_set.
>> So build masks for the PIO_SODR and PIO_CODR registers and write them
>> together.
>> 
>> Signed-off-by: Alexander Stein <alexanders83@web.de>
>> ---
>> This was tested by using an own test driver which uses
>> gpiod_set_array_cansleep to set multiple GPIOs at once.
> 
> I remember J-C brought this up ages ago, so I hope he will be delighted
> to see we can now, FINALLY, do this!
> 
> J-C can I have your review on this?

I will check it tonight

Best Regards,
J.
