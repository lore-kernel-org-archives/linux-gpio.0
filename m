From: Ramon Fried <ramon.fried@linux.intel.com>
Subject: pinctrl: -EAGAIN not supported but documented
Date: Mon, 21 Jan 2019 15:28:50 +0200
Message-ID: <94b9acab-a739-a014-b068-768f40de38ec@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Stated in Documentation/driver-api/pinctl.rst:

Since some controllers have special logic for handling entire groups of pins
they can exploit the special whole-group pin control function. The
pin_config_group_set() callback is allowed to return the error code -EAGAIN,
for groups it does not want to handle, or if it just wants to do some
group-level handling and then fall through to iterate over all pins, in 
which
case each individual pin will be treated by separate pin_config_set() 
calls as
well.

----

This is not supported, and there's no code for handling it.

Should we add the necessary code or just remove the wrong documentation.

Thanks,

Ramon
