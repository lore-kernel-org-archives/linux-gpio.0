From: "Frkuska, Joshua" <Joshua_Frkuska@mentor.com>
Subject: gpiolib, gpio removal while a gpio in-use
Date: Tue, 17 Mar 2015 02:59:08 +0000
Message-ID: <190351B32828744FBA3BD9565204D27B5330D2D2@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:57541 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbbCQC7K convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2015 22:59:10 -0400
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp
	id 1YXhin-0005SI-C5 from Joshua_Frkuska@mentor.com
	for linux-gpio@vger.kernel.org; Mon, 16 Mar 2015 19:59:09 -0700
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello,

In 3.18, the upstream commit e1db1706c8 made it acceptable to remove gpio chips that were in use in exchange for a critical message. The reasoning from what I gathered from the mailing list was to avoid handling errors in the device remove handler. The justification was that the error seemed unused by most drivers and there was a compiler warning when ignoring the return value.

At a higher level, this is a gpio handling policy shift. Previously the behavior was to result in an error and disallow the gpio device to be removed. Then starting at 3.18, it becomes ok to free a gpio device regardless of whatever the (possibly critical) gpio may be doing as long as a critical message is displayed.

Prior to this change in 3.18, I ran across a problem in 3.8 and in 3.14, where I have a gpio expander chip on an i2c bus controlling some external power regulators. The regulator reserves the gpio and puts them in use. Then if for any reason, the i2c bus adapter/driver is destroyed/unloaded, the i2c client gets destroyed causing a dangling pointer to be left in the gpio descriptor gpio list. Since the regulator knows the gpio id any subsequent access from the regulator core of the gpiolib causes a dereference of this pointer as follows:

1. gpio_set_value_cansleep() <in my case it was due to a regulator that used the gpio being put/switched>
2. __gpio_get_value()
3. gpiod_get_raw_value()
4. _gpiod_get_raw_value()
5. chip->get()
6. pca953x_gpio_get_value() <any bus based gpio expander in this case>
7. pca953x_read_single()
8. i2c_smbus_read_byte_data()
9. dereferencing an element of the i2c client pointer causes invalid memory access.

This can be prevented a number of ways but all seem unclean (e.g. i2c bus driver from being unloaded/hot unplugged if there is a non-zero reference count). I would like to know if there is a preferred approach. From my understanding this use case is not supported as the comment in gpiolib suggests.

/* gpio_lock prevents conflicts during gpio_desc[] table updates.
* While any GPIO is requested, its gpio_chip is not removable;
* each GPIO's "requested" flag serves as a lock and refcount.
*/

Should a hotplug gpio chip be considered? If the answer is yes, then I would like to ask if there has been any discussion regarding this topic and if so, what the outcome was. 

Fast forward to 3.18+, this issue goes away because a gpio in use can now be removed. Doing so cleans up the gpio data structures and eliminates the problem above. The consequence of this is that the gpio may be put into an unintended state when freed while in-use in the system. An example of this could be the gpio cleaned up/turned off whilst controlling a regulator that is being used by some critical hardware function and it wouldn't be so obvious to a root user that this occurred just because he unloaded the bus driver. In 3.18+, where should the logic for handling the removal of a critical gpio in-use go? Does it go in the actual gpio device remove/free function or somewhere else? In this case perhaps only the element using the gpio knows what to do or at least should be informed in or
 der to keep things safe.

I realize that putting a critical gpio on a removable bus is a risk itself and can be mitigated at design time but for the sake of the argument, it may be unavoidable due to hardware constraints. 

Thank you for your time 
