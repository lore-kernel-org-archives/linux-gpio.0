From: Olliver Schinagl <oliver+list@schinagl.nl>
Subject: gpios search behaviour for gpio from _DSD
Date: Thu, 24 Sep 2015 09:25:06 +0200
Message-ID: <5603A552.9020005@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hey list, Mika,

With commit 0d9a693cc86 the following snippet of code was added:

+       /* Try first from _DSD */
+       for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
+               if (con_id && strcmp(con_id, "gpios")) {
+                       snprintf(propname, sizeof(propname), "%s-%s",
+                                con_id, suffixes[i]);

and I was wondering why the gpios suffix is singled out. Are we not 
allowed to check for all the strings in the suffixes array? Is gpios 
special or is gpio simply not allowed. If that strcmp check would be 
removed, would bad things happen?

Also, just to educate myself, isn't relying on left to right parsing 
complier specifc? E.g. if con_id is null, we end up passing NULL to 
strcmp and atleast for libc can cause segfaults iirc.

Thanks,
Olliver
