From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: Re: [Kernel] [PATCH] gpiolib: rewrite gpiochip_add_to_list
Date: Mon, 11 Jan 2016 14:56:21 -0500 (EST)
Message-ID: <1369375079.157733.1452542181031.JavaMail.zimbra@savoirfairelinux.com>
References: <CAFy1USRc8=wwpr9rGkcvYR5gdO-cz1c1onfngSAECb94XpmGgg@mail.gmail.com> <1452522913-6298-1-git-send-email-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:38588 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759152AbcAKT4Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2016 14:56:25 -0500
In-Reply-To: <1452522913-6298-1-git-send-email-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linus walleij <linus.walleij@linaro.org>, broonie <broonie@kernel.org>, kernel@savoirfairelinux.com, arnd@arndb.de

Hi Bamvor,

I checked, your updated patch works well for me.

To improve readability I also suggest to change:
if (&(next->list) == &gpio_chips)
To something similar to:
if(prev == list_last_entry(&gpio_chips ,struct gpio_chip ,list)



----- Original Message -----
From: "Bamvor Jian Zhang" <bamvor.zhangjian@linaro.org>
To: "julien grossholtz" <julien.grossholtz@savoirfairelinux.com>
Cc: linux-gpio@vger.kernel.org, "linus walleij" <linus.walleij@linaro.org>, "broonie" <broonie@kernel.org>, kernel@savoirfairelinux.com, arnd@arndb.de, "Bamvor Jian Zhang" <bamvor.zhangjian@linaro.org>
Sent: Monday, January 11, 2016 9:35:13 AM
Subject: Re: [Kernel] [PATCH] gpiolib: rewrite gpiochip_add_to_list

Hi, Julien

On 01/09/2016 11:16 PM, Bamvor Zhang Jian wrote:
> Hi, Julien
>
> On 01/09/2016 06:56 AM, Julien Grossholtz wrote:
>> Hi,
>>
>> The issue is in the break condition of the list_for_each_entry_safe loop.
>> If there is a chip at the beginning it breaks even if there is another
>> one after. You should check the next chip:
>> if (chip->base > prev->base && chip->base + chip->ngpio <= next->base)
> Thanks you suggestion. It indeed fix the issue you mentioned.
> I will send the new version after I make sure there is no other corner case.
Could you do me favor to test the following patches?
It works for the following ranges: [0,31], [32,64], [-1,32], [-1, 32] and the
other test cases I wrote.

Regards

Bamvor

---
 drivers/gpio/gpiolib.c | 65 ++++++++++++++++++++++----------------------------
 1 file changed, 28 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3db34e7..9460f94 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -189,55 +189,46 @@ EXPORT_SYMBOL_GPL(gpiod_get_direction);
  */
 static int gpiochip_add_to_list(struct gpio_chip *chip)
 {
-	struct gpio_chip *iterator;
-	struct gpio_chip *previous = NULL;
+	struct gpio_chip *prev, *next;
 
 	if (list_empty(&gpio_chips)) {
-		list_add_tail(&chip->list, &gpio_chips);
+		/* initial entry in list */
+		list_add(&chip->list, &gpio_chips);
 		return 0;
 	}
 
-	list_for_each_entry(iterator, &gpio_chips, list) {
-		if (iterator->base >= chip->base + chip->ngpio) {
-			/*
-			 * Iterator is the first GPIO chip so there is no
-			 * previous one
-			 */
-			if (!previous) {
-				goto found;
-			} else {
-				/*
-				 * We found a valid range(means
-				 * [base, base + ngpio - 1]) between previous
-				 * and iterator chip.
-				 */
-				if (previous->base + previous->ngpio
-						<= chip->base)
-					goto found;
-			}
-		}
-		previous = iterator;
+	next = list_entry(gpio_chips.next, struct gpio_chip, list);
+	if (chip->base + chip->ngpio <= next->base) {
+		/* add before first entry */
+		list_add(&chip->list, &gpio_chips);
+		return 0;
 	}
 
-	/*
-	 * We are beyond the last chip in the list and iterator now
-	 * points to the head.
-	 * Let iterator point to the last chip in the list.
-	 */
+	prev = list_entry(gpio_chips.prev, struct gpio_chip, list);
+	if (prev->base + prev->ngpio <= chip->base) {
+		/* add behind last entry */
+		list_add_tail(&chip->list, &gpio_chips);
+		return 0;
+	}
 
-	iterator = list_last_entry(&gpio_chips, struct gpio_chip, list);
-	if (iterator->base + iterator->ngpio <= chip->base)
-		goto found;
+	list_for_each_entry_safe(prev, next, &gpio_chips, list) {
+		/* at the end of the list */
+		if (&(next->list) == &gpio_chips)
+			break;
 
-	dev_err(chip->parent,
-	       "GPIO integer space overlap, cannot add chip\n");
-	return -EBUSY;
+		/* add between prev and next */
+		if ( prev->base + prev->ngpio <= chip->base
+				&& chip->base + chip->ngpio <= next->base) {
+			list_add(&chip->list, &prev->list);
+			return 0;
+		}
+	}
 
-found:
-	list_add_tail(&chip->list, &iterator->list);
-	return 0;
+	dev_err(chip->parent, "GPIO integer space overlap, cannot add chip\n");
+	return -EBUSY;
 }
 
+
 /**
  * Convert a GPIO name to its descriptor
  */

tested-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
-- 
2.1.4
