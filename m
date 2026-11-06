Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979230;
	b=4sc7nsqml39N5MLCYGh7ZH/W38ukABrR6Fbszkh0Shw7qq9nCa5Il9dj/pGnXzj4HIre
	 tfwk5Nm8nDwPtLKKbnaTRjE+PnO25gj47i3zUI0C0qCRG7+mKt5rFy4c7nYkTA4NOWhRq
	 YuPbVLTsDzrjHnzy4ztgeHowD/pj9M6N1n+Hbgcb9PAZwzfND91ZbGe86mueAMS96//N3
	 poStebF8isBmQscPHGXfj8FG/mjiaOzssc5xHLwmEfKd9bGuMGEbRWrIhFdFKPPPTllqj
	 yNmQw6EPiYIugu35+QnQma595fCrZab2hHC674FsR721rDStR6YcN8iySFnXIoBb3ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G1ZFrJmoKEm1ZQDDeV68P+KaD9B3DrntJ9AbviR+4p4=;
	b=i3Z+sUdmzYwp1RY90uQz6mjixZEAFpXu+xAUNR1b/vhC40DZosy9H1RHEBqKc6nag8DY
	 7H/D+ash4/GTIEj7gOiGkmm2DEqXov1Vj4DQKRgEQnmgvHa/BwBZ3sUv7Vdc5pTtEqbEq
	 L/v3UWI39tat9XXDiQ0yinBYyE2AC6oQYvdOnwyRXINpmIT7jePmXBbBreR04Qf6ZuqLN
	 ILxDtOGBicAZ8wUbfixxrbqEBe7FsnEXQQSvYwZQ5EoeBWwzNGXTOZUfoeaIq3G7zOVNR
	 YkkuEsjNfVqvpQv+gB9454swn8r+kwAmsmL4qjH9mBwDzGGADwqvucgTvrZnfvr2yyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKmAXkp9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TU3z9QQH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F56606A32E
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 15:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F56606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKmAXkp9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TU3z9QQH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0LOo3927580
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 15:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G1ZFrJmoKEm1ZQDDeV68P+
	KaD9B3DrntJ9AbviR+4p4=; b=dKmAXkp95NmceLrq/G/h1IQgYjyZ9yuOqaOU+X
	CfXGQnEz3xscfqUT+dvK3Ds6WMDeqiODGV0ffJyKSYli4WbofArlpDMDwTzE4XaJ
	XRW5fyYnxlvzHNqaQDsIxkquTh1kWor5nQ7+Vhp8YDRTkQd5i21F8F9R7F5s86Mq
	p4oTvU6vKh9hh6qHuUoUoVZz82oDOEFIDWJtGz9yWJHjxrYdFNqjUN39zHfR0W1/
	6BgO3ZoC31d4IqucP0olgPppPisF+PE9+G5TfGsMGu1oyd1wk8ttZd+3zmSsPfHW
	NOD1Sl2x9R3y2F7xX9LjFg4kW+7QlZyiDFLmznfnn8Q3A8+A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa3d46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 15:33:49 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99859876e19so146393241.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 07:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979228; x=1794584028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G1ZFrJmoKEm1ZQDDeV68P+KaD9B3DrntJ9AbviR+4p4=;
        b=TU3z9QQHX4BqLqVTZ8f2Ms/wFhCRbv0eEVqCpZ2zd/xm0piQ9HQ5X6sOJ5k4fk5xOA
         8TmVBjY/+ibSIaGu6W9QaXJJk8ZrX6o6u9ghcNG1FlfMU11rqYu6oHqYpl781/opURK6
         bjQjQ66y8fP8JLw3E0YASPllZPFc9la72Mi0Gyr75JYxAuH4Kpa5My2Zo6ynkz4rfjx8
         NZ4U/1qaxJjwcbtW8UbGpf1hLu++d2Egm/ojX6XwulL7IB5LHnK6QKYwDOoEFIM8662D
         jFeBdz5l3whYf0cskbHceEk3+azRsXiy7ghD5XUcJCIaucoDA4NJEq65H83PJtjEF+Ht
         NlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979228; x=1794584028;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G1ZFrJmoKEm1ZQDDeV68P+KaD9B3DrntJ9AbviR+4p4=;
        b=MQs4eKNnE5Fj2Q/dkDFyFAHwqYC2RSNy0abaERomdt9PlR2ez/q9UvHB4bcE3tvueu
         rn9wulbVcoSEyNFYTc8xvRi1Aak46CU5DmGQ5dP0XEgao6KzWSAmKW6zdG79En63s4io
         2pHBlEOcz51keOko5V3OxEDKspA+xZFIqgVdx88K/irMXcnX1tCM9kYJQxeOjnIRtj2u
         +4Sk3EYkcXc+cCzdRsTBGtBwt3sCx+bauiHDBi1JlMfT8AlN7Y1xqmFYBDJmepzgT5sX
         4vvZOmtF8Tb7qfXalnsO4wqm3p4TKFDsww9i3yDcpSu9G/NPhYryXp1tCCEmH1omFp6y
         7LrA==
X-Gm-Message-State: APuU4Z9wS+88u0BJ4hg2YkYgyUB5TSND98iINg4DM8I9h+SgXNF1OaBL
	M6PMfhYCs3dnJ8ebV2rwkLLiZgDEaYR8TiiZIleqt40yi0XXJGDuN2YzNqcOESrxWFtIYaug+Qj
	c5i/aGSlA3IIDMell6juZtq4x1LOasc7jdWk4Zvrg5PnS7dJcTeLTqi01W5N0HvwOJrVFBcfF
X-Gm-Gg: AYBFou3duq3BzMfgKDQoh86JZUkZUkoUykZ/tJGTQqH+hHwJD/eXpdawbhIkwosIbLD
	peqzBg9PZX/8b5aTXs0SmmMv47WwUS8bbC7bTwUc2zhmGECMiUmZV9RTAKJ2GnLbmlen94OWGQo
	IWYb0AsuTtLfBmFeyzRa8sbJyEVNxHFIsFX5mmR+JlDRsyKxoZx/RlfDwwTkFqR9auxVuz51R2O
	FJGM80X/L6jsWXqW5AhBQNhgkRuRG1Z3k06Itn6nGkkq0Xq/U+70wu2r4x06p3UNWY2KD0Uu5nc
	Hf3OdQY8bp0niiSxKyPrWpQSBVNf9kkg0/2jPAr9r+LshEUbvfzc5yX4BLw3IQnlUWAlosA6FJI
	3Ja7hz49XU0g7RSTZM4SY09UQp+Sfmr50bEIY4gP7xC9uCxiUJROKPs4V0U1PcaYdfjzih8xg5c
	eKfw==
X-Received: by 2002:a05:6102:508f:b0:7d2:8dd0:301 with SMTP id ada2fe7eead31-7d2a166f095mr1397425137.29.1793979228406;
        Fri, 06 Nov 2026 07:33:48 -0800 (PST)
X-Received: by 2002:a05:6102:508f:b0:7d2:8dd0:301 with SMTP id ada2fe7eead31-7d2a166f095mr1397408137.29.1793979227771;
        Fri, 06 Nov 2026 07:33:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76031265asm29603215e9.4.2026.11.06.07.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:33:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 16:33:45 +0100
Subject: [PATCH] gpio: virtuser: fix interrupt leak and UAF
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-gpio-virtuser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFjz7WoC/x3MSwqFMAxA0a1Ixi9gUxF1K/IGVVMNip9URRD3b
 nF4BvfeEFiFA1TJDcqnBFnmCPNLoB3c3DNKFw2UUm5MmmO/yoKn6H7EEkU3PJzHid2ItqQmo8Z
 TYS3Ewars5frm9f95Xix83yNsAAAA
X-Change-ID: 20261106-gpio-virtuser-irq-uaf-leak-392b42bf2833
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3951;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X3CGwkCMFhQqUGqNpJL/j/edYRDWPzS7au0W+PzOmPo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7fNae0WZiDuvb9VaFd+CIUlczloIyURCFjRFs
 TJ5j9sXRI2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCau3zWgAKCRAFnS7L/zaE
 w2YnD/4om7aGJ+28/5A42nhYI+A6BJkBAJ3yo+n7KlsZ0Cc71YOQXSaNJKhIdXaNzAZ+sU9ReKo
 nycGF0T6ryFnmM8mdfMm0bwP0c3Nv/Hw7yAGVhKr/1EDYOVQ2Z2EU33uYV2Btm/aJSZRgnoq1P7
 V9NcRA00a9jWtS+MladYM/38CzUYmBhpv3i1W5DXLGsG2GeEo7kA+vLOUOGwLcAKL5oe5kLbJWL
 GOqlV29DmZJPIpoSsgfY5NZYI+ZWGoN1+cich5LWmzXjn3FOhIOX2aamwc9UdIO1BeEl0f9MGPG
 aQvUJTR4ZzqBFm9OdL5xcK4by/T0Upk9GtIZFqPZ8bZxj8KKcEPhmHq4RxGC/Noi0KJM35kbtdK
 /hhDnIOgTtDAtdi1SatNQMIo8gtSN4PCY6ym2pQRlbsTTPrxc0YBO5I/wcEjjlFKtF1EY0Oi4HT
 NOyzpxyfC6D35F7gTVwo/LiOeqDMgsgy/07prUmXAWBznVajPiFwavpl7wZoWTREA2CNXAriRG0
 NHHqbaQLtORIFLtTitLrEuv9Omif223gxIXDKcAKrsYjddo7jbjTMdkktqFt2i2m5jzr+HRCpg9
 eNQG/yPuJ2k6pCduqMOUtgpZCn6YF+YB+SUaJ/7h/lNldzKkVh7NalCjvUVUBblm29DmURFUTJH
 6mjgXQLLpwpyAAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: gaNaWuqi5wA_BHWM9seeLCiQvVoPUycH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX/4gyKqbYGM26
 +2uTqjtn0IR/JMRZTBM7RJbVxhpnSu5r3hbS8c4FDsHuFceE8Z+tgldWAHNtDCa+cv9mQWPUXX1
 +ZA9OfwaL4bIdUnlvle6qcrGMSEqUwIld8fSKEvDYiShQMNifiAQskWbx66ARvwngQi9nHSei5f
 fhx6mOyerSEQ4pPfEUrkRsXzfyDpibymoh92xJThh9UAfUxBt8b+fOKqPA1feq3i0WWWh5lHhMd
 0dqyfTpHKvGHxsmLEVrMRHMHFns14mqKMnBJQ1gQcrf3UeiRuupEJgfpM0BJVdLnuXBFg4me77X
 hXV8/MXzulLJfFq5WTgYbRhjZmZcsSyhV3vi0vugO4xVgBojraToyqYww5QtJfJCHsgf3grWDGL
 oDrk1swQSR7xO8KkkAc3KTGpR67g3On09qF5qbrAlLXsgnK/h+lqVw+OBLMtfCOyHaxh1nOS0Qm
 mCV0jfuWLO+BF8OvXJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX5417aXLaHmXO
 v+maQupB8J+1F5hHQboe+XBzZucQ3ZpN9LeYia4AwbOSuPJYAdG2mxYnLe3MFfbFxRImXECNgQ4
 OI86G7+M1hZP1iG7XhIGYmsdLRfj43E=
X-Proofpoint-ORIG-GUID: gaNaWuqi5wA_BHWM9seeLCiQvVoPUycH
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aedf35d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WVLbfADCyz3l7nWlDDIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060061

When configuring interrupt handlers for GPIOs requested by virtual
users, we never verify if an interrupt has been previously requested and
just leak it if it was.

We also never free the interrupts at device unbind. This is both a leak
and a potential UAF bug.

We use atomic_t for the irq field for now reason, it can't be modifying
or read from atomic context. Let's repurpose the existing consumer_lock
mutex and serialize access to the irq field. Let's add sanitization of
input and schedule a tear-down action.

Cc: stable@vger.kernel.org
Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Closes: https://sashiko.dev/#/bug/linux-d8935133-0e80-487a-9e00-e748056f595e
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-virtuser.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 185c1be39b27760b468011acee1c21e649e87f8f..21b4bc64d4d346c51811491ab1d92b4af36ec3c6 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -55,9 +55,9 @@ struct gpio_virtuser_line_array_data {
 struct gpio_virtuser_line_data {
 	struct gpio_virtuser_attr_data ad;
 	char consumer[GPIO_VIRTUSER_NAME_BUF_LEN];
-	struct mutex consumer_lock;
+	struct mutex lock;
 	unsigned int debounce;
-	atomic_t irq;
+	int irq;
 	atomic_t irq_count;
 };
 
@@ -607,7 +607,7 @@ static ssize_t gpio_virtuser_consumer_read(struct file *file,
 
 	memset(buf, 0x0, sizeof(buf));
 
-	scoped_guard(mutex, &data->consumer_lock)
+	scoped_guard(mutex, &data->lock)
 		ret = snprintf(buf, sizeof(buf), "%s\n", data->consumer);
 
 	return simple_read_from_buffer(user_buf, size, ppos, buf, ret);
@@ -635,7 +635,7 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
 	if (ret)
 		return ret;
 
-	scoped_guard(mutex, &data->consumer_lock)
+	scoped_guard(mutex, &data->lock)
 		strscpy(data->consumer, buf, sizeof(data->consumer));
 
 	return count;
@@ -675,7 +675,12 @@ static int gpio_virtuser_interrupts_set(void *data, u64 val)
 	if (val > 1)
 		return -EINVAL;
 
+	guard(mutex)(&ld->lock);
+
 	if (val) {
+		if (ld->irq >= 0)
+			return -EBUSY;
+
 		irq = gpiod_to_irq(ld->ad.desc);
 		if (irq < 0)
 			return irq;
@@ -689,11 +694,13 @@ static int gpio_virtuser_interrupts_set(void *data, u64 val)
 		if (ret)
 			return ret;
 
-		atomic_set(&ld->irq, irq);
+		ld->irq = irq;
 	} else {
-		irq = atomic_xchg(&ld->irq, 0);
-		if (irq)
-			free_irq(irq, ld);
+		if (ld->irq < 0)
+			return -EBUSY;
+
+		free_irq(ld->irq, ld);
+		ld->irq = -1;
 	}
 
 	return 0;
@@ -793,6 +800,14 @@ static int gpio_virtuser_dbgfs_init_line_array_attrs(struct device *dev,
 			data->ad.dbgfs_dir, data);
 }
 
+static void gpio_virtuser_free_irq(void *data)
+{
+	struct gpio_virtuser_line_data *ld = data;
+
+	if (ld->irq >= 0)
+		free_irq(ld->irq, ld);
+}
+
 static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
 					       struct gpio_desc *desc,
 					       const char *id,
@@ -809,14 +824,18 @@ static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
 
 	data->ad.desc = desc;
 	strscpy(data->consumer, id);
-	atomic_set(&data->irq, 0);
+	data->irq = -1;
 	atomic_set(&data->irq_count, 0);
 
+	ret = devm_add_action_or_reset(dev, gpio_virtuser_free_irq, data);
+	if (ret)
+		return ret;
+
 	name = devm_kasprintf(dev, GFP_KERNEL, "gpiod:%s:%u", id, index);
 	if (!name)
 		return -ENOMEM;
 
-	ret = devm_mutex_init(dev, &data->consumer_lock);
+	ret = devm_mutex_init(dev, &data->lock);
 	if (ret)
 		return ret;
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-gpio-virtuser-irq-uaf-leak-392b42bf2833

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

