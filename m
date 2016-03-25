From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] tools/gpio: Add missing initialization of device_name
Date: Fri, 25 Mar 2016 13:36:30 +0100
Message-ID: <1458909390-2686-3-git-send-email-geert+renesas@glider.be>
References: <1458909390-2686-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:39806 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752570AbcCYMg3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2016 08:36:29 -0400
In-Reply-To: <1458909390-2686-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

lsgpio.c: In function =E2=80=98main=E2=80=99:
lsgpio.c:166:7: warning: =E2=80=98device_name=E2=80=99 may be used unin=
itialized in this functio
n [-Wmaybe-uninitialized]
   ret =3D list_device(device_name);
       ^

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/gpio/lsgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 1124da3759424fe6..eb3f56efd2158b4c 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -147,7 +147,7 @@ void print_usage(void)
=20
 int main(int argc, char **argv)
 {
-	const char *device_name;
+	const char *device_name =3D NULL;
 	int ret;
 	int c;
=20
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
