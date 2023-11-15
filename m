Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF8319AF
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 12:34:57 -0800 (PST)
Received: from [192.168.1.103] (31.173.82.108) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 15 Nov
 2023 23:34:54 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] pinctrl: stm32: return errors from
 stm32_gpio_direction_output()
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <linux-stm32@st-md-mailman.stormreply.com>
CC: <linux-arm-kernel@lists.infradead.org>
Organization: Open Mobile Platform
Message-ID: <5ce023a8-db0c-13a9-be42-09e3348ca44d@omp.ru>
Date: Wed, 15 Nov 2023 23:34:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.82.108]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/15/2023 20:12:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 181389 [Nov 15 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_interpol, subj}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.82.108
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/15/2023 20:18:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/15/2023 6:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

In the STMicroelectronics STM32 driver, stm32_gpio_direction_output()
ignores the result of pinctrl_gpio_direction_output() for no good reason.
Let's propagate errors from pinctrl_gpio_direction_output() upstream...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the 'devel' branch of Linus W.'s 'linux-pinctrl.git' repo.

 drivers/pinctrl/stm32/pinctrl-stm32.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/stm32/pinctrl-stm32.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ linux-pinctrl/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -240,9 +240,8 @@ static int stm32_gpio_direction_output(s
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__stm32_gpio_set(bank, offset, value);
-	pinctrl_gpio_direction_output(chip, offset);
 
-	return 0;
+	return pinctrl_gpio_direction_output(chip, offset);
 }
 
 
