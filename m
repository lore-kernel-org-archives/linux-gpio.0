Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99764519BA
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322219; cv=none; b=pcYhwHHgcFq76OCs4YhL7ShuiQ52ikDCf1WkMEQr9GMMX2iS2xi3nPTLv+P97MqYvjAF++m3kK6owvKgurwDyHtv2QBc8RI+p8SrQUifA1VMh9rG79BKp9cD5G9oufWZm02FbyX7ApC5U3pefWKwPmAfKZdIK4BrFShHa77rPKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322219; c=relaxed/simple;
	bh=AD6u7FdoeUADwTnTJ/GsHGXbI7Jju8HXgSAGAH8Uy3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KASIoC+HLiLJHF6lWzwMFdI3wM5yNjhl8ppdgLEHcUxUe6sTfI18cFySRKZ4AEMMICiczMisAZKsmWN0DibEff/NzmwWlZQw87E//tMgnWnkscQLh3n66FlS6jJQyrY5vzlzE56KjhMrKhNnwyBTvAPvMOBXQZVVAjffuCoEekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIiqcfKq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xvw9+lXS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIiqcfKq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xvw9+lXS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ye2X1193864
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 07:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M/DWbxeGSIRIL3H4zTAb/a
	2zRJf/Vq+YD16QWknpe5Y=; b=LIiqcfKqXKmfhIK1/ZC+Gtaf3+7ej0KjyJj9ov
	/ZywfjJGlyXdR4PnLawwfhEduuhiu2GlWaGWZ3GAXVyhmCxp7Zan0CH4hLrCkAZi
	EmJxswJW8CFnllbKvCUDTen3RWWjPkyNOUVmgybxJ8q8aTXntqza96hAVq9v5gdd
	HNZT4/6/h+nbxkQt4DtSUGNUYFfFlXcfT2Zw9k252Od6Ksp6VVWm5tpPG8ENbdej
	5U6RDc8IKzBwqwuAnSq2dlciZhMBlUBpE1Vo3P8ZkNfN5/gT1t+Hnj4qLROGPXCv
	gT7a4pgX2tgHnmUxk0Ld1AbLzHJ8jWsoBQW+lFNuKumA/qwg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jhe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 07:43:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fc0097865so17543771cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322216; x=1790927016; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=;
        b=Xvw9+lXS4PhFfUo7vMelMgUCgUT1R0+Z1YZQgviSaRuLoTy7i3Oy5PbAIsDjc/hJif
         U0ekaRwjEjkuAyd2Ua5Sh7n3q15czGuurtxQpTTzngYivw6UlMNbjiDXCBbUUmNFyhJa
         P6CHlowKyxvnU/HdBmDa7C3BAcM/pz2+PACnxcCTVJnSu/M5mijuf2fACZG+wACF61oo
         v7upBJbM61IqgTmxKIfPahngf2MoSm3bKzdUwkHcDI4PnP5nXbzfRCo1kTgLb+dWHc+k
         av0r1JjDnWN9+soczNz2OFRgeevmDjadugywBnco0T2nv7/nVp9uI6fGhd94qSbYtBhK
         H8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322216; x=1790927016;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=;
        b=pA1k2D/JBcfnaxVWM6s6muNDu/e+fd+kxzLHdtpTo6bfwGM9D6T+egJmelrmw9mcXZ
         6smnWtTJQlGfTVfcj+GSMYaI1aUkpS2enXs+6rg3dq22QMJsgV8ZFR3EZKyV3C2xb11C
         6LH26MTFNhjZN7sVtVI4Bou7AJrPTNMHP27IxhytIq4tQ/M/oTknvFs88m/FMqc5Z63e
         ujG7uz5BUEtoSsCLGS0yGSe4q/4oI6PgmCXq3mcFF2FXwsNjwJ98EwYij10ybLPGJk8K
         +LXI01mghpM5BEDe47Lc/EQVe+kdCv9EALewY6mx9BdKKbiJvB+C7SxrwiQ/fQ33B/W4
         htNA==
X-Forwarded-Encrypted: i=1; AKwUvBxPsEnC93Q7h+oHbVC22ToVHe9JFeKb8LEFB9VmuMmygXGctZa6di5MIjfrQQi9umMUDmPlp3VW0XDu@vger.kernel.org
X-Gm-Message-State: AFuF++m29hCXAvof/YiDZvYU1jGB7ZX4zRVzIq6xey/HcstkP1QSYXpf
	uCoFrnurkbwT33dzSc//vzet1P2t/T1hm/7dUW7PualE+m0t6vDDHdazSFpVDcBHr7YswdgU6CH
	LlLTbZaWYsRaL6jT2yZH3+fU3AbXrwAmTNJRio923dGj9shXwZqeUoQCD9gta6Yky
X-Gm-Gg: AYBFou3haX5XJrgZcqtEOZJVPw/X5aQoyzR74PBHVeeHaOcv3wryRG7H+KKZ8Vs5zYC
	bWbCR3kn9XVSX2nCThZzoHOhzVp5WjDQxvnJnoKGvUHyybrOKodqWY+d9bjv9kF5UPdTl3w2v5U
	z5IBt/9GQQSMGylzct4UYX6N6aOR/EcWf1VR5pVbOdVPvU8u5s9KeAix/DBNU/4r+x80L1Wbj0q
	JDnxrWlUbikOXNkagTMYok/Y6zNoy+ob+RAUXLm+EXRRAfX4Gd9gQczf9vaCOZRiq3cX3/s2gFn
	5QxFr+KXhaJwxxtgtIUp1F31v2vymNJjJZXkw8r0qTPREc6qzOPcDewgGe6sfIs6xb9hVP3rZBD
	6SqVTGS54hKOUJLkACKAYvaxUr7q0
X-Received: by 2002:a05:620a:2b94:b0:93b:c3ce:9056 with SMTP id af79cd13be357-93c43cc71afmr302936285a.1.1790322215798;
        Fri, 25 Sep 2026 00:43:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:93b:c3ce:9056 with SMTP id af79cd13be357-93c43cc71afmr302932885a.1.1790322215287;
        Fri, 25 Sep 2026 00:43:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee911e9bsm53820945e9.1.2026.09.25.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:43:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:43:17 +0200
Subject: [PATCH RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64
 platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABUmtmoC/4WNwQ6CMBBEf4Xs2SUtIARPHuTqQY+GQ20XaCIUu
 9poCP9uww94meTNZGYWYPKWGA7JAp6CZeumCHKXgB7U1BNaExkykZWiFhUqP5YFDioQ8qA8Gex
 n6xgLXWpRmcroPUFsz546+9mWb3Bprs35BG30B8sv57/bYZBb+nc7SJSYS9XVRabuueiOjjl9v
 tVDu3FMo0C7rusP/MHD0c0AAAA=
X-Change-ID: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Drew Fustini <fustini@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Frank Li <Frank.Li@nxp.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AD6u7FdoeUADwTnTJ/GsHGXbI7Jju8HXgSAGAH8Uy3Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtiYgnMpt+ze/3gOBof/K5QUMTpTjKTsj89xpR
 aYhi4BObeyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarYmIAAKCRAFnS7L/zaE
 w0SrD/4vfSDU0oVoElzWp+gQZ29LGTH8q+y1RBxSnlUiiIpKfUXPbSaGgB+OtaszwgI8R+/H9ib
 iDLtS6bnV5R5oHaqG/zkpMt8n9Ghb5CdU4kriuimfC6KxSAp+GL2zmRQkKm/w3Tjq6rYahaRFn6
 PZ1WWNZVe56L8nlVfDjpAAj+r4UQxuOKyrCFjAxoBpV2wsf63ryBOVHZgUOMkCE4axrjBnBLKmp
 ert7OYK6xC0bB5rDYIhEmBTAj3dutD6SsHHbWVLKveMUUIvLbwm7UJBN2Mv2SUB5tmFrdvhcGmo
 dInoZuK5ZqTWUk8gN86l9XeQeR9fXk9QBiZRhhHz318rz/saJMOsqbwNhBkWJgKOe6lZt9YlJZQ
 MgaOS0lMSXaZwyGfPpPisDvspKulNpl8dIAe1tO/ctpD4P2c8cnkOOstPcthxhFu1h53CfWuGNU
 4cHO7+xICvfFb4ceqaA6Y2fqMvO0Cb8e+0PYQwY8iTl8sfFwdQn3q5/o3Me5IZJC2aJQ7TnUfKQ
 8h5OyCQQjAs5Wsaqi0wG83KVVCar3GL/o7NzlRVp5skiDE9kdpO/bQsmifQaGLq3mx4a6G3s5zv
 Y9mxgrHgu4ny7Rnku2vYmEOqHAqqE61E3nUKFzbF6Bhk+HC30bPHh6KPSJ9ez+3uxlvMGcgtc0M
 rLchbTXc9wQBXcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: MNTtEnD8hiWAblwdqIHdzZUWk6MpgqHM
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab62628 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=xAMoY1eAQyGtPIDUt64A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMCBTYWx0ZWRfX+NXjbFrCrQ6v
 +D+KHXdzHWYSaEe6VDEzxwhEltDwkTe/2YxLvkHyB0A3mVgnAX3DfPgInrTCfv3HA8yyVfCOveH
 1DO+8L0eLZnZhwnzHt8IyJLoyduD5MoVDtuEWjmqNJPh3MX1IFi3M9sWG52TB4oQKGFnCj4NbQr
 eLC0fTGzLnzLxLaIwfnJZ9H23trDKyD8/OixXxEyls9qYRgIqdIi/sKEyN5FEl4D+n3TtOdi8aw
 GXs7DJv4t2w3jeQuuj2jPt2ZpDojqWldA1ngFC/AfPhu6dOFmqmbrt92adxwsafXGv2us2xGYZ0
 etopMfanqfIFvB5oVVcTGWDkyy1w5k25ZW3EsBRDmF4FtaOLUjnow7Pdjie0Pe2yDfOmBq9A/Rj
 X7zGCXXzgYcUx7Fbv69BeBLHBb5b9wIif/bWXB9wJR4FnLKfVaeVf3j4SgzpTmsUbecDbNXaaQz
 yhLIT1BjY+pEKUQw0WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMCBTYWx0ZWRfXzCG4ygdo/KLU
 1iCv1zIsfduK6mKawLmT7trStAvr8tAd1MQcGcF09IqpxM/ff3GhTD0ShIDCp+Nw955QtdAOwEN
 DxBOmN7VpOZ6H5WxkT1+zZohGqYY5O0=
X-Proofpoint-GUID: MNTtEnD8hiWAblwdqIHdzZUWk6MpgqHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250030

Shared GPIO management provided by the GPIO shared proxy module has been
enabled for Qualcomm platforms for some time. By extension of the
defconfig, it's been effectively enabled for all ARM64 platforms when
using the default configuration. Bugs discovered initially after the
feature was first enabled, were fixed and I haven't seen any new reports
for several months. Make the feature enabled by default for all ARM64
platforms officially, which will allow us to continue the removal of the
deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi ARM SoC maintainers! As per Catalin's message[1], I'm resending it to
wider audience. Can you please queue it for v7.4 via the ARM SoC tree?

[1] https://lore.kernel.org/all/arPfRFC5jzVaSQvq@arm.com/
---
 arch/arm64/Kconfig           | 1 +
 arch/arm64/Kconfig.platforms | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 94cc8075460f0a763cd82b2cabbdb80275042935..19e453b1214353e842e0aa9d3ff9f684c5b693e5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -195,6 +195,7 @@ config ARM64
 		if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
+	select HAVE_SHARED_GPIOS
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1489bad527d8e61584b2a29e5161820cbc0ec0f7..21fb82ab4983f80fc3eaba7cdb5627cf80a18c95 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,7 +37,6 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
@@ -329,7 +328,6 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

