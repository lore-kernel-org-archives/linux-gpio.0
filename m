Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318438;
	b=HgjastNvfqXwQw36Eyn+bF7cB9IzlqLNBBpvTSZbaO9/1Rgwm3wMRabO0iKiD+unFMp4
	 FYnCeeHQGmspo2ip9+y5XLVQ7146LV3pT7nDTZliYuU5JyOF+UznkSIQA/Z1eCtaCmeT4
	 /KfX36LlZZbp/6knkyW4URGrKNxDTE9mFSgVNEY9/zCpwr0ItMPXW7eU6OKh2ZfFb1i6e
	 1bZ53jnaUhpEs4B3Il8yU+B/QVt7aXjsSFfJKjiEejatlOA8W2Z9n0ZYtaP8ihoQt58pn
	 GUbexFOjU/budpea24TbwXYrNL4ZqjAFAyVtHwqUT6zgoaS7xixVQ0p+k4SIipSne4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318438;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dJ+U2YutFM5RbPW9Ej4YIsn2VBj/dgAUmwJsm3Q//aY=;
	b=Ye8v7YSflxc2jjgrbDYDB+iUQyq70TaIkcqUBo0EgQE9uDVbOyJ80EU8AxrNwHfRbG1D
	 NW4ibVg7dyQUetx9XtHafSJdH3L9vp+5xRdbiYuiKonP74u/Os9k9PhpddRnURie90IJr
	 u2OPF4ZcBfaVPlf3a46NH18c8n/n6NZfz2jLVkvdOqOMmR72BW3SGI5d2btjBHECbgYak
	 j6WENBm92z4qsryJZW5AA7NWu+SomqLITf3+D1AQjZExwhV3z+46AbMp5TmNojipoRG3m
	 rTyCxH12qjjwODROdlrhhwgJCF7wjzTKfL+n8q2rS9RT9HbySIDTOmlchN9aHZdEUSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK+IZev7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fBRnHA3s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9529D60A3817
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9529D60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OK+IZev7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fBRnHA3s
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAOEx1599664
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dJ+U2YutFM5RbPW9Ej4YIsn2VBj/dgAUmwJsm3Q//aY=; b=OK+IZev7Sui2ws/x
	pj/VDl9codL8yxqAhet0lT/dZse2qDFgKRXCqaaHctjWGby19AL3yaskhrXr9aU5
	pfRUROijfXclUVymlH8Ljes8ur1sd/be463JSOHK+PlAvJW0U5engjl50LMKprmA
	bZE4cTtqGwWn1hC30cp/Oo8dh2XuifWWfkXTHQzfgxwXosL+uj3GwzVX2+HuTVwh
	QsDoM4F+T+yT8FRa6WZkxtHd3QPJGT5IuumYerf1U89aPUurHr2QDrzEKiftHGZ3
	kLV8jN9ZmDkjNoMeVcteIElSWmK2p8na5A1pOqFHswCvjnBJIHscEuvyBd7R8Roi
	WBxkZA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4aa76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 13:47:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99089f9591aso423303241.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318436; x=1794923236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJ+U2YutFM5RbPW9Ej4YIsn2VBj/dgAUmwJsm3Q//aY=;
        b=fBRnHA3sT6PBTBuuyX35y6BTWdVJz107NZoha4hBiLz3kdOtN+iaoSEYuz0o0QUlJK
         azq213OJaG6vjxJ27HbEj/AKTPFFnGhp7EGyUTXHJO5aPuV3/KMMrnTqrEqzkO0vVjas
         yNBpLvcpk+6RRMIGMn537NlcNflhof9Zctrucp6bCBKIBiPkerykZizqC6l4GDcAGMAa
         V3mPBJki04a8jgefM8UWX7J0qFkXzzm1R8w8trMS2T5qabAK9AHXHmDHL7edqVaPdkG6
         ij6eI2H78t5pGKpodisGFtD+ZpS/Z5R+laGvFYUuaoBZVPDmBSI6Ls6WamFS0XrOrbJo
         mGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318436; x=1794923236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJ+U2YutFM5RbPW9Ej4YIsn2VBj/dgAUmwJsm3Q//aY=;
        b=nLZHX7d2anjAQD4vZg/nzXg57umcDfc7dImOi2hGDoZTA1McjylX9dIu0TvgeKahWU
         uDkwvge8svH7oKUmcI6E04+BShwuD/dYfsfWKUJmdA0eON34Io/Wof4S8IZXYtICZOYQ
         u9c9AiG21+Mlk2YpfqL3CvXzYU0EA4CNG6v8y2FXR4OEaNBkHELRtBbL+VvNjqGuodxr
         xidFeIzwj1JWn6M0MG1QNaAOp4Spdbd7xqJqqWp/KxAV1PAEa08PIAAKnx6E5nj/9Lni
         dnXid/8laWufvtqlD7MdrzPzSOPY/YmKYs8gCqLeo9qEfpSn9ILBlNMUeEorxww56/AV
         gTNA==
X-Gm-Message-State: APuU4Z8FRtZQrE5cu34AIoYAxuG9v/poxsSyIo5aLTPYqYAPqkrf2I7o
	qy9cKlpes4I6w0ym4AMKjB4+OOhccHHhOgmEJLlr6gWBe7Fby/8d+dDcL7d45dFbtPus978sjM4
	Dj/7PRvNlV163bLa3TkD09vvQz2zd8TobDpUsRbIXkAcf68eWe8v/Vvz7QR2T9Cy3oAKHEBqd
X-Gm-Gg: AYBFou3HRLD95PFUaq9bXN+iqTPPnLMa3ga2JAdGniD11GTbWMlW5jszvg+uuzB6TVI
	hevXKgoGv+yDbbZ2LqJwC3XhWrOcSCoYDMLoPzfklYrETVVOt0HkGLbRvAef81WoZWau8WRFGC6
	QXHUrJJQHQixNy8jjK3t2FsjzFgndjhraCIEy8yzwlidqsW7+jPPvBTTLHPN5TN99AlVPZO+icR
	p7yZ4+48VipBJhFuhWXMTkf8eW5Xm5xPU2qdp9aM9KMkjz/7xVQcAhVCcrAC4KvrsBA+ngBMTlT
	qW66C2IIoxTFb9tYgtL8ndkqLpzbEHo9zd/SoqlHW5B6DzWdW4coJvg+CMpTTyfACEevT9xPCUn
	kpk+wJoprPlUyQpQsG2ANcyadqu0Q1xa6OHiipKxby0vuA2fzEjkv+ZVfHVdeT56+zzaDwtqxVs
	IWP518dXreK8mQT6pktw1e082zRnhPQdn5pnWTCY2UUkhLVLbCT6SB30nUJmkgIOY=
X-Received: by 2002:a05:6102:510b:b0:7c3:472d:be6b with SMTP id ada2fe7eead31-7d301c0603fmr723166137.33.1794318435718;
        Tue, 10 Nov 2026 05:47:15 -0800 (PST)
X-Received: by 2002:a05:6102:510b:b0:7c3:472d:be6b with SMTP id ada2fe7eead31-7d301c0603fmr723157137.33.1794318435216;
        Tue, 10 Nov 2026 05:47:15 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:05 +0100
Subject: [PATCH v3 5/5] gpio: cdev: don't overwrite the whole flags field
 when configuring lines
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-5-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7662;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NLV4vYUJp70N/TSLYmeeEfPyGfkzChoHR4tUv2Nm0AU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYTKKEyvwKP/lIQDWPyaXXzaor8R1dO1z82
 3VpdC4rOfaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 wwaVD/9T0A6rXbcWKxIzadcfqCo7JMS2rGi+5xbAQFWcaVPAjEIWCaSbaE0CUbnkyyrEj/Fs11Q
 Acy5XIz/qZmMsxNPn1rRoGHb23WZMk3+u/jkPhI/PM9g3QnIaH47RNapz57rNqV3warPx0VzCmi
 yHuanoippBLeX6o1tGhLR4GKcv9t41OAIcFJSwDhVDI2Yp7kcamzTk4K9FKdjBXc+Zv2Yz0piGq
 r84ASEXENK9K/07CXbQtn8P1a07NwTaLO+lbokBA9wObZMoQv2hB44BT3HdObgTDFL9XxWCu16N
 IkZ6oCpJ7r9FzWiN55vKwcboVA0LvHhPWu7KDGSX8j1OlEHjvubln9BlQ3flMuk4XLpU8Q2hGdi
 AFji/tIotgXvjaR2IvpZyoRgnB2wxq/8iVgxhDk28ZDkUgMzYMhizwMSg1LKHcp48eNSlcQ1RNp
 kYtEN6GyOR6b1X27xEoO76riG1a+zCdKhhl3QT6McN4FJvzTu0HnC6yqDh0EG5m8t0sh2JuEb9U
 dbl4unyT98mm+BwXDjzQNfn9bdlkaIEzVzjGHoOAHZL/Jl83vY8JY3MA3icbkrpmgzDQzgOybP/
 n2h4O8zeC2TllTPsWCDVYlIMlp4+wUFR1w49ahoGyFw5xFCRoMFRp2IJMDrg2zPgr9dsmyjBGEX
 6dCu0dRKGrD6vog==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX2DGIGIHTdS0T
 7QWZfQTuytcHeeRhfyqU9nWUjj4IRz8/LwSOlVHhN2nQTyvXAsHv4Vu1YDW7m3xg3rvlB3tQ3vz
 F+1xwpa+R/AxQlQeAn+os59ULopzm2U=
X-Proofpoint-ORIG-GUID: qf8ghT9ZAr6N41-cvhYt3C0ovAlpBKiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX9HNljg7Tc5yr
 QLgGocAJwlU2A30NLF/puxqpQCcNV6R4Ps1xWodunLTdWkCmuJ3L44YBzTsyCrjYTZUFMP98c48
 ffO7U0SYYaZgr1VJ5086hCD4ooYohtPQyp6D6vnTGvx1HMovBQ1x4NrOJrZX/gFqcIlWL9IwkKp
 +G/TSGQyFzdq7UgHEm+UxbKN7EuwFLXZqsPBb7Bu+4oYrr/NSGOb7/iW8FLvQA3BE2foHn0J+2n
 BItOHZvrvraipw92xldUW8ttMUb+hFVWLwbt8Oa1yBpamnYDuAX25jOhzVYiRNR4lC0qTSImYIr
 7MR1K5qNmNqG1uIyOtPwAZ7v1QjAmtYnMiEPUdi3sPU+zxCj4Itf8OTzddbb1JgngCKeg4jnhO0
 u0vT6AgsPYEko0XEhfRmju5vruugOLeoh1GlxgRaXFW1XCUExwx9FnnVhvAbD95WuGrQwr5vn4h
 sc0JKNk+gvHs9GiSRKQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af32064 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FxeHtzAkRt4RPYSLnXUA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: qf8ghT9ZAr6N41-cvhYt3C0ovAlpBKiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054

linehandle_flags_to_desc_flags() and
gpio_v2_line_config_flags_to_desc_flags() read the flags word with
READ_ONCE(), modify the local copy and write it back with WRITE_ONCE().

The per-request config_mutex does not exclude sysfs, the irq core or
drivers touching the same descriptor, so bits they set or clear
concurrently can be lost.

Build the mask of bits owned by the line configuration and their new
values locally and apply them with gpiod_update_flags(). The whole
group changes in a single atomic step.

While at it: rename the functions whose semantics changed from
"conversion" to "flags update" accordingly.

Cc: stable@vger.kernel.org
Fixes: b7adfb6076ff ("gpio: cdev: update flags at once when reconfiguring from user-space")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-cdev.c | 93 ++++++++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..464a3a480eb83e9f60455311d0328a776497b7d6 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -140,24 +140,25 @@ static int linehandle_validate_flags(u32 flags)
 	return 0;
 }
 
-static void linehandle_flags_to_desc_flags(u32 lflags, unsigned long *flagsp)
+static void linehandle_update_desc_flags(u32 lflags, struct gpio_desc *desc)
 {
-	unsigned long flags = READ_ONCE(*flagsp);
+	unsigned long flags = 0, mask;
 
-	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
-		   lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
-	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
-		   lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
-	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
-		   lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
-	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
-	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
-	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
-		   lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+	mask = BIT(GPIOD_FLAG_ACTIVE_LOW) |
+	       BIT(GPIOD_FLAG_OPEN_DRAIN) |
+	       BIT(GPIOD_FLAG_OPEN_SOURCE) |
+	       BIT(GPIOD_FLAG_PULL_UP) |
+	       BIT(GPIOD_FLAG_PULL_DOWN) |
+	       BIT(GPIOD_FLAG_BIAS_DISABLE);
 
-	WRITE_ONCE(*flagsp, flags);
+	__assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags, lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW);
+	__assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags, lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN);
+	__assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags, lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE);
+	__assign_bit(GPIOD_FLAG_PULL_UP, &flags, lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP);
+	__assign_bit(GPIOD_FLAG_PULL_DOWN, &flags, lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN);
+	__assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags, lflags & GPIOHANDLE_REQUEST_BIAS_DISABLE);
+
+	set_mask_bits(&desc->flags, mask, flags);
 }
 
 static long linehandle_set_config(struct linehandle_state *lh,
@@ -182,7 +183,7 @@ static long linehandle_set_config(struct linehandle_state *lh,
 
 	for (i = 0; i < lh->num_descs; i++) {
 		desc = lh->descs[i];
-		linehandle_flags_to_desc_flags(lflags, &desc->flags);
+		linehandle_update_desc_flags(lflags, desc);
 
 		if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
 			int val = !!gcnf.default_values[i];
@@ -339,7 +340,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (ret)
 			return ret;
 		lh->descs[i] = desc;
-		linehandle_flags_to_desc_flags(handlereq.flags, &desc->flags);
+		linehandle_update_desc_flags(handlereq.flags, desc);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -1216,37 +1217,35 @@ static int gpio_v2_line_config_validate(struct gpio_v2_line_config *lc,
 	return 0;
 }
 
-static void gpio_v2_line_config_flags_to_desc_flags(u64 lflags,
-						    unsigned long *flagsp)
+static void linereq_update_desc_flags(u64 lflags, struct gpio_desc *desc)
 {
-	unsigned long flags = READ_ONCE(*flagsp);
-
-	assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
-
-	assign_bit(GPIOD_FLAG_EDGE_RISING, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
-	assign_bit(GPIOD_FLAG_EDGE_FALLING, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
-
-	assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
-	assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
+	unsigned long flags = 0, mask;
 
-	assign_bit(GPIOD_FLAG_PULL_UP, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
-	assign_bit(GPIOD_FLAG_PULL_DOWN, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
-	assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+	mask = BIT(GPIOD_FLAG_ACTIVE_LOW) |
+	       BIT(GPIOD_FLAG_EDGE_RISING) |
+	       BIT(GPIOD_FLAG_EDGE_FALLING) |
+	       BIT(GPIOD_FLAG_OPEN_DRAIN) |
+	       BIT(GPIOD_FLAG_OPEN_SOURCE) |
+	       BIT(GPIOD_FLAG_PULL_UP) |
+	       BIT(GPIOD_FLAG_PULL_DOWN) |
+	       BIT(GPIOD_FLAG_BIAS_DISABLE) |
+	       BIT(GPIOD_FLAG_EVENT_CLOCK_REALTIME) |
+	       BIT(GPIOD_FLAG_EVENT_CLOCK_HTE);
 
-	assign_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
-	assign_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags,
-		   lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
+	__assign_bit(GPIOD_FLAG_ACTIVE_LOW, &flags, lflags & GPIO_V2_LINE_FLAG_ACTIVE_LOW);
+	__assign_bit(GPIOD_FLAG_EDGE_RISING, &flags, lflags & GPIO_V2_LINE_FLAG_EDGE_RISING);
+	__assign_bit(GPIOD_FLAG_EDGE_FALLING, &flags, lflags & GPIO_V2_LINE_FLAG_EDGE_FALLING);
+	__assign_bit(GPIOD_FLAG_OPEN_DRAIN, &flags, lflags & GPIO_V2_LINE_FLAG_OPEN_DRAIN);
+	__assign_bit(GPIOD_FLAG_OPEN_SOURCE, &flags, lflags & GPIO_V2_LINE_FLAG_OPEN_SOURCE);
+	__assign_bit(GPIOD_FLAG_PULL_UP, &flags, lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_UP);
+	__assign_bit(GPIOD_FLAG_PULL_DOWN, &flags, lflags & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN);
+	__assign_bit(GPIOD_FLAG_BIAS_DISABLE, &flags, lflags & GPIO_V2_LINE_FLAG_BIAS_DISABLED);
+	__assign_bit(GPIOD_FLAG_EVENT_CLOCK_REALTIME, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME);
+	__assign_bit(GPIOD_FLAG_EVENT_CLOCK_HTE, &flags,
+		     lflags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE);
 
-	WRITE_ONCE(*flagsp, flags);
+	set_mask_bits(&desc->flags, mask, flags);
 }
 
 static long linereq_get_values(struct linereq *lr, void __user *ip)
@@ -1404,7 +1403,7 @@ static long linereq_set_config(struct linereq *lr, void __user *ip)
 		 */
 		if (!(flags & GPIO_V2_LINE_DIRECTION_FLAGS))
 			continue;
-		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		linereq_update_desc_flags(flags, desc);
 		edflags = flags & GPIO_V2_LINE_EDGE_DETECTOR_FLAGS;
 		if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
 			int val = gpio_v2_line_config_output_value(&lc, i);
@@ -1660,7 +1659,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
 
 		lr->lines[i].desc = desc;
 		flags = gpio_v2_line_config_flags(lc, i);
-		gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
+		linereq_update_desc_flags(flags, desc);
 
 		ret = gpiod_set_transitory(desc, false);
 		if (ret < 0)
@@ -2055,7 +2054,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	le->desc = desc;
 	le->eflags = eflags;
 
-	linehandle_flags_to_desc_flags(lflags, &desc->flags);
+	linehandle_update_desc_flags(lflags, desc);
 
 	ret = gpiod_direction_input(desc);
 	if (ret)

-- 
2.47.3

