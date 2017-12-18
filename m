From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 3/4] gpio: sysfs: don't use sprintf() for 'value' attribute
Date: Mon, 18 Dec 2017 11:08:33 +0100 (CET)
Message-ID: <1fbada4f02475f69abbccd105c92dc3512dd6ab0.1513591276.git.christophe.leroy@c-s.fr>
References: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84f3fa77ff5a0b7ac73709de8bdcd93a2cf95271.1513591276.git.christophe.leroy@c-s.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

A bench with 'perf record' shows that most of time spent in value_show()
is spent in sprintf()

--42.41%--sysfs_kf_read
          |
          |--39.73%--dev_attr_show
          |          |
          |          |--38.23%--value_show
          |          |          |
          |          |          |--29.22%--sprintf
          |          |          |
          |          |          |--2.94%--gpiod_get_value_cansleep
          |          |          |

value_show() only returns "0\n" or "1\n", therefore the use of
sprintf() can be avoided

With this patch we get the following result with 'perf record'

--13.89%--sysfs_kf_read
          |
          |--10.72%--dev_attr_show
          |          |
          |          |--9.44%--value_show
          |          |          |
          |          |          |--4.61%--gpiod_get_value_cansleep

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/gpio/gpiolib-sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 1b0f415df03b..bb10e8ed456e 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -110,7 +110,9 @@ static ssize_t value_show(struct device *dev,
 	if (status < 0)
 		goto err;
 
-	status = sprintf(buf, "%d\n", status);
+	buf[0] = '0' + status;
+	buf[1] = '\n';
+	status = 2;
 err:
 	mutex_unlock(&data->mutex);
 
-- 
2.13.3
