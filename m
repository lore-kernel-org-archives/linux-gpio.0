Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257FD429CEE
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138440; cv=none; b=q1t1uHpQjgd7U+EuiJ4MmyZSSttjIOnDGZiaGR6/yNeda0GhdEosKbab6BJu+LIktmjFBZa4PmXFf2Rhzhi62wJSZtELotc/Xk8KS34bRez2iSt56va8RHkVAJ6+MOxl7fjTINlahFR25w3qQoYhh4elFyHF4MIsVqkWAVm4sNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138440; c=relaxed/simple;
	bh=Qjt0ImWaPoLULJSFVDaFQ0fOmeE5T/u5+zco1KFI0nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DlHYGAFRuPOpyRJR4C5aLroz4Ef7ijYzwrPfDagvA7oC9pkxIyht4GO0mMnPE1yT8IPuUbGuqh6qF+hxCDPnBlRJdyX55IbveDLPZQ5w0WwFdz/gvg2QtkVYBvxVjBLfT+N1CeiAtJ7w9VgwQBuCMFYy7xA6ODAwwzgwW2EW6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7RnU2DZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGSwCTYE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7RnU2DZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGSwCTYE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4R0tT3800381
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kuPF0Y4twrIcLIzCKcknx7
	X/u8SkXoaz3VxXQbGtel8=; b=A7RnU2DZqbuTo/dyxCh2RlVtKCZFyP8i7VKp4O
	Bnop5XBTcbpFs96qyHSm6DdAj1oaRh14EvrNihl4kgXhMZIcsYDrEW+tAKK9Py5n
	fnxmu5cWyNzl+2TsGc70wPuztwNAZCzmoE+5H5eDB6HNBujqAT62zDVMHYRFrVlz
	viI9xBCAp5cA2zjkDmoiyxez28tQh6HaBEeeFZpQD0+HH/Vei74R+BoYGISG15bq
	5hwsMmjiTn5TnjkMwt1Kjzfuel7Q2cI9jI+IgtjEHIl5hqh0fywn+ixeyTISZdlm
	tDafA+J1WwIFzAtlSowmh2639jqb7y0HVTmrH4sgcmVF/1AQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5sea8wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 08:13:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so1295657385a.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 01:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138437; x=1792743237; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kuPF0Y4twrIcLIzCKcknx7X/u8SkXoaz3VxXQbGtel8=;
        b=AGSwCTYEcOYUURvZ0usXc1zoXNB00xMqOJUYXTfDOfyWfmqB20X9z6siUAC/B+HJBE
         zpAIy8oTYGvqyYNuleGfzE9jbBJUFQMe/3SwRJek0by4spKI83Jby7OAgkIp3jUPHbXj
         dQlu68Mbp9fdkM+sOwn9K+ZZeCQyN4NmgJQzrn+F8K+1yjOGJcb9gW3ArzuRVkXM1KBL
         x5cgbFVvR7VVLbCk19v40sm78N1V+pEm06ra0qgMiSSFNtjceaqMbDx5IiAuI9qMCzBI
         2FI/9I3JKaJX4I1gmgXrdaxU0WigGeIjom/Lu3iO/zUKmC2u7TWCdVoFCi2aTsDytmVw
         ByVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138437; x=1792743237;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kuPF0Y4twrIcLIzCKcknx7X/u8SkXoaz3VxXQbGtel8=;
        b=X97kFpI1txY5ZyQvQLMmJqXfV2bB0tmG+q9Lyts9pb2zZU33fgyUIkR9uR0dFOOz/B
         3bjruF2wZ7ZQOyBRnmEulz36ahSfuc6k9V9iS9Z16zqR+BGNoeDrgf59+sHnl5HATpwP
         gtCubRFPHCcNCUUNoB0nAcXgaLCOMOdWBZo5r8yUlyZmHLl0bk7DColiinCBw27Rw9nF
         YUCCQJ+KgHcZMLaMufw5gE7F3n0oCOXLbgr9GwAniNoX4JdI2Y4pnFpru+uEsfykLff4
         AWI4MH0B7+4cBjvbGHK6xIoUXKKOcgiycHGfoTTv15PFBs8HGpKGSrhVfN4AejdlTJ5B
         IJ+w==
X-Gm-Message-State: AFq9FYI6VW6ARS/uKev6uTyHZWREWpQNt9cMZvs5wzZInaHI2hDQTA3v
	r+Z42dJCOQStt17jSXjm0CI7zllESr681wficprIm3SxrnXhEnCdqwQfaGSx1ybJ54FxsD2YzZw
	WodJImCgflzQBLCvRBIza1IDzo9jngj84rkgWYU7b3XHuQFVKFk5oLaClaCI3fYoQJSTWe1Jl
X-Gm-Gg: AYBFou3VR0zXiNm0bxVfNhz4KpojEDR774g/kumRS3sx8+GFKHPhnFcm0UdnSEcibaK
	64oocjUFJ5NizxOSQLs6x2qk1cbYw80UgD9IL6BO3WWXViZiiwo/Z3RQdPgGl/ZwPZ50onCnDzv
	qidEzYr4HbJsRm87maTtc1vudEvJEmMHVfiKPjYXYpZ8unj753wUKJ8tFhGv1vu4/6IWU26zF82
	EJYaBCwxrtT4C/XXLmaonWL001vnSg6aqQojTjKE0T8zmnRMZBrpgkj/guyGJ3QuDEaGZny8wfY
	RDcMWWVuyd5/nK66b3nnhJsLKmP9H7gIBpWwK8ypsqay3y65o0mq/4t721Xor3lS/giRzkBA2G5
	sN53aueUBLUQWxh3kPmgTMR3NO0mh
X-Received: by 2002:a05:620a:800d:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f12d474afmr610066585a.80.1792138437118;
        Fri, 16 Oct 2026 01:13:57 -0700 (PDT)
X-Received: by 2002:a05:620a:800d:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f12d474afmr610062985a.80.1792138436482;
        Fri, 16 Oct 2026 01:13:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm3622190f8f.31.2026.10.16.01.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:13:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:13:50 +0200
Subject: [PATCH RFC] gpio: sim: access sysfs attributes as const
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL3c0WoC/x3MMQqEMBBA0avI1A5MFCNsK3gA28VC4qhTbCKZs
 Cji3Q2Wr/j/AuUorPApLoj8F5XgM0xZgNsmvzLKnA0VVdaQsbjuElDlhy54TainLopTShHrhlq
 yzrUNEeR+j7zI8b6/MPQdjPf9AFIiIuNwAAAA
X-Change-ID: 20261016-gpio-sim-const-sysfs-attr-350706cc7500
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2719;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qjt0ImWaPoLULJSFVDaFQ0fOmeE5T/u5+zco1KFI0nc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0dy/6RzJjr3GP6PPiEm+WGKWOaTwfm8FdiOGl
 y9h1D2C+7iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatHcvwAKCRAFnS7L/zaE
 w0kmD/9iFOpdnx/+89CShNAcyi5wnvvz1sCeJLeDKLwmfZXE+HfW7ezEwLORTyvbpld6nVW6QPB
 10zQBKW3q6CIG9TuTagdk5UEvofhYkQcD6JMHiJysv968GFE5tVfRPyvTx0D5CEfMwlSBKd1E2o
 V0MESs0ImAlKQGtD1wP2zt5S8Ogh7BrlOXdcCsyolin3MYzW0za+cvU/ffkE4rpu6lrJgJtwxgn
 PCgGSAycB5kNmDx+kuXAtNpsdQMYgTMYP8GqPwKi1KpoO1GdHP78FTQugQRRZrA60y/w6XKcBBM
 KyJ2WiA/u8nikTXXviPuKPO8pSUoWF7eWD9q3Lm5gw3Ys4QUjLp/kdMcti/78uuPu5jMrKZ4gWz
 FgT/f/Vsv8QfzOM79Nmam4mPAyGo1lLPc49sNo9Ok9sMmmU3+eFKFg5ebsn+rbFDI3xFPaXFrUY
 nTIdm0+qVff8L9W+aCb2HLoNguVrOPq5G/bmI04jxI4lk2dQuaWC5XJl9jBqkPz1EElPz8JZ8q8
 fIOVfiij1L2qlUHf3V5XBHJ9EKrQkjhlBgWUzK9y51IbZaGxF2J1P/ULPoqay5HKG4onmgWygge
 ni1maD3MEspcKZ0Ksuuj/u5nvThQWzD+Ej9kCEWtrC1M3m276zbuzI0Rn1fLJbHmvgjuHTIA5jJ
 Xf+ivSYzuUzsbAQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX3Vh9RSCrZ5q3
 /TMRbdNSAzUnzjArN17xJF+zFIpcDExnWu90wR+Q9fxYHczIqXZPN7AhG0yOkIo1BS9Nk0IhwXQ
 n+Gt5kfZx4z8uHMeJyJEiQrXinU32As=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX+ZNntRWA3PtA
 3HDaiKTXVEOjvq9Bo3PfH3o5hFzZX5YuDbtwOcF+mEsBz8r9oYfP9ptPGQa5yidaCosIOHgJDdc
 gt3YDwWppskaBaXJvSv9IsrjY5jpkaQ8aVsMIGQv6OgQ8OU+o0gqMGqmSi6GSpvut5u/79Qy3rI
 Eh/cka8FJuTpXGlpHw9SjWkZsDpLaVv3ercs1N9g4Pku5vqnRffLxrXd8PV7WM+Ms5HFMr8SpzK
 Gzd16KMkIjVlBKedbyqIV7GUcG1arFa4MOmQDC7LbhHBiZpY5a8Gbp2it/ha5YqAeK89AFD5SNd
 fy+CwA0oNHslF+RC6/v9WT4QPWYvlN8jeXMqKfozZkk2+S2wZH+37+QBXjB+zaxQ3i0HKWTUspm
 8KYw1m0fWlQz9I5uvqUYE0f+qS/CYf1H/XgQNfJ1w0vnJASMPpPnXjB1ng5JcNvGRDXrXe+4A1d
 OznzjP4iavbwNnYjyIA==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1dcc6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=fcOsHt8QbKoA0gQdPhQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 748J6J1fSRCZaP9TLSRPQF-vG9fnk_0h
X-Proofpoint-GUID: 748J6J1fSRCZaP9TLSRPQF-vG9fnk_0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160032

Use the const variant of constainer_of() to access struct
gpio_sim_attribute which wraps the dynamically allocated sysfs
attributes for value and pull of simulated GPIO lines in line with the
currently preferred approach.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi Thomas!

Following your talk, I'm sending a patch for the GPIO simulator module
that attempts to constify the sysfs attributes. Please tell me if this
is all I need here as the attributes are part of another struct that's
allocated dynamically. I'm not sure if there's anything more to do here.
---
 drivers/gpio/gpio-sim.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec042670fc5706b4a93700e652cbaf3605e..e0ae586cd08d8adbb3c16918607074fce116654e 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -59,10 +59,10 @@ struct gpio_sim_attribute {
 	unsigned int offset;
 };
 
-static struct gpio_sim_attribute *
+static const struct gpio_sim_attribute *
 to_gpio_sim_attr(struct device_attribute *dev_attr)
 {
-	return container_of(dev_attr, struct gpio_sim_attribute, dev_attr);
+	return container_of_const(dev_attr, struct gpio_sim_attribute, dev_attr);
 }
 
 static int gpio_sim_apply_pull(struct gpio_sim_chip *chip,
@@ -272,7 +272,7 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int val;
 
@@ -302,7 +302,7 @@ static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int pull;
 
@@ -316,7 +316,7 @@ static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
 					 struct device_attribute *attr,
 					 const char *buf, size_t len)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int ret, pull;
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-gpio-sim-const-sysfs-attr-350706cc7500

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

