Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A3642464C
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236598; cv=none; b=m9/yP/fjrw250fnxV9Ap9Q0x/iYEnAQz5rWGkBmuy8PjAUiCEHCbq5i7Ufk5m1TbltnySq7AORSv+rdIoOprPVG3tV/m59I6HS6DrLFwsdg2ZfXz6nTt6nWBYMRsjmViklCUeYq8ZUxivpwi9XxJUtag3CoSSiPbYrA48sikJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236598; c=relaxed/simple;
	bh=EjfjJhyKkopIFf8jZCgPQAegYPIJpv6YvDDhZgvzbTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oOb1NjE1uYY0SWPovxAL928DhWD1dzanJTiTD/t0srs6q5v5DA2xUfAe8SfDS05gBCcPhafrFjlEQ1LMkipY2Yb3yt7dZTo/9/R3ntgsZyEbP3jgQzKEmfFlMlg3ecpbqZ3kVZT047KtVqNBysZtGl9EhG8lIDeerk9jN0kUmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+AQudHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giuCL6XT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+AQudHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giuCL6XT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgTmE2687897
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 11:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NQD0Nq50Trjosw/cJsYhN/
	WG3UOQUuAE5o16CdOdw4I=; b=C+AQudHmyplDuyRyCScpu0bE5MZNwvuCJ63tUt
	Q0rlYfcrNBGC6QQIlsAnmz5UJ/4OZzXXulMak9wCRZWmADKQ6o2OXvr7fd5BSDtQ
	C7YH4pByTbPZrEU1hiAZumwRlgX9AZHtTlCakEzECnK5t32X11Ev8cC6xpqNw4I2
	U18Xv8ZC39IC4qp00Efruu1FtUCj7cOJ8FBoWLT/HVI33e9qpIzgjb6Zcfasg63T
	1nyIVciuDxlkpG3xukhL/8URrI/s86MNGKFB9YXAMHnSVgZFzB0x9KUYIwjftjXG
	BLAG2T4TjuYAGrzkrB8HW72GYgFyEENbK/yF/6zBQf/1hcMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7jdbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 11:03:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so81320655ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236595; x=1785841395; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NQD0Nq50Trjosw/cJsYhN/WG3UOQUuAE5o16CdOdw4I=;
        b=giuCL6XT0t7gmoC7wP3729jWU3+V6vPXM0yBUzwSk+LZuLr7fQp7x6FaEzKhh7FJwD
         IbPr7w+LHypDC4xKnL778Dji2CLgRBRKtBHaiJ1u68IkiAzwrsRqxDyTMk8bp3hIDxp9
         SGyJbxkO5Mu2roOtOyTbR5vHR2INeImMveihBzHY/k2FaB3Y/4o9IDaT7XtKq1W0Lcqy
         8MgBiunLYhVM/6Wahb5XUj17aDbOy1CsIcQqA4yp28luCnAHiTYA9380qUss+CqZ9nil
         MgifJHxRd0Bpq/658Gm9q26Er51bd04KUEw0n8VxtmVqCuy3iqfqwVDza5sxHSmcFa4U
         ce1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236595; x=1785841395;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NQD0Nq50Trjosw/cJsYhN/WG3UOQUuAE5o16CdOdw4I=;
        b=Q7ZKLhjjy5SRMe0/PjaZYl7p7AOmcahWTqs2Qu3ZgdQYtU+V6UhllmjD6l7OH5TTOd
         wU7iPoRZ8uukiQeH4uBsNrgMo/x3ngmh+msU4Aq6qcs7MflWqACh6gpNFtbmsPdYbsUp
         cLIBSInuK+udA8iKMmNEX9n5tu+zvKO9mtlB6B2pObJjuX3KBqNTLBL44ToAXAox9Nwn
         Z9PwCS7VLyvCcNGvxJRZH9t9uRnSltRoaWbYE75MMpaJy6WEQeSNAnPDHrd/KhC4TVqV
         v9RlzfYqKc8bYfbYGrjg8cwbNKavMGJERc9S9k0iqDWYFYSA9vtRYGdpLqxuSV9n/L/7
         OrrA==
X-Forwarded-Encrypted: i=1; AHgh+RoLgoY3WeISrMcMpz3i2mSVgjtT5oI1fNKcCY5xQrB9CdAH0XPxtIylM9sHW3OoJdtlZbb5p3GBSIUT@vger.kernel.org
X-Gm-Message-State: AOJu0YwthtaudhG9zg9kTBeYh+3uMCge5YtIJE+XZGJ6pPcvKxOCnZSX
	wOsNXbWwbhtumbwyTWfFHgRD4WhsU+EbsT5NclIIzuN61ZmkDEqycT7a/4lF79cLcCvB5WsxSuy
	UNpwXOGF9aIqyqKbuWyqagWVbqLKVMWvzoWz6fG9jag8uXhoVbOU3wKgytDBEThdW
X-Gm-Gg: AR+sD10hZG1CP54ylRHQq/+SuW0R8WaSeslid3Khzld0gPQjOWT7spcyapghuzqYo+H
	V0gEfoKT61DgYg1QfNaIc9taKgXAzj4FxikAthH1J3YncY2GOjwdQcxfMRM3NAiRF3Ut8GjbDv/
	Nhm/P+dQkMrvYh3jGzMUM7+hN1SL1KSofaB2ywta0DPTXHhvIoNJAIJatbaVRflXB8M1jIvopkj
	uShH/aCoPnY283GsdyUQ/8Q/Z2QL0UjvWJ1WlalMfxI9R1k2rUyRIVWwr6y01JdurydATTTO2lh
	dYGJnGTzbg16SS4nRR7wcKl56aKkf6YcLHzjJMOoOC22QZEBeyweXxR4GZRP0P1Yf4d0Pa5KUIE
	ImuVPAQCPtIHQjs4=
X-Received: by 2002:a17:902:cf01:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2d015d23360mr21443825ad.26.1785236594431;
        Tue, 28 Jul 2026 04:03:14 -0700 (PDT)
X-Received: by 2002:a17:902:cf01:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2d015d23360mr21443075ad.26.1785236593880;
        Tue, 28 Jul 2026 04:03:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdb7sm49850535ad.38.2026.07.28.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:03:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:33:08 +0530
Subject: [PATCH] pinctrl: qcom: shikra: Fix intr_target_width for summary
 interrupt routing
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGuMaGoC/x3MQQqDQAxG4atI1g1oELVeRbqQmHZ+lKlkhrYg3
 r2Dy2/x3kHJHJZorA5y+yDhHQuaW0Ua5vgyxlJMUktX9zJwClh95h1Rs2+MmJ2/WHLg+yCqba/
 SakOl392e+F3v6XGef9bYR1lrAAAA
X-Change-ID: 20260728-shikra-pinctrl-intr-width-982cc47c24c1
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785236590; l=1264;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EjfjJhyKkopIFf8jZCgPQAegYPIJpv6YvDDhZgvzbTk=;
 b=PlPaquflpDSRUlGLs04B9moFMs1fkciY50RA88Wax9zwx0jnwDDlRA1xsbTnHcUtSFe6i+KMh
 1/rfkzOFe59CvJ9Np+64zHPyAZP+tIjPexX0kiavG5YUWXhNGaUUOfc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfX4FlYqnMSfnuA
 8iV1ABRFS7la3+4bMqqWmKpScNnnSwJJ4Tf9y4RrRGhb9PHG4hoI8HO1k0KJEzrTPldvBV/rb2I
 7k/uss8YwYg2GEJIOGkh9M+oasRlhAxKPiWk/jjNguTBwwhCsuvlw8W4ARoKul4hpJO6ZUlesri
 v0Q43FUxG7PRIvrxKkWEaMGn6he3AwTyrfjoX+zUADf6r4/lRCOKA6BuKmj8hEd9Y1QrjI6XO1L
 /YDbAkAf5vMTOYuoWoJAgZqGgMEVxX3c+yYuNukmSe7dHeRHodwfCDJC89Ic6MUnShvElm2Rg5Q
 6X9JNYmZu54vLLZXpF0VEiwXBkwV26KFLP24f70jQaGJt7fmGaTn/i3P7U75uG9sWVKQt3jYFu5
 PheT0xuo9EfiWBlUwNTZogNQLNhEFRQkCweAgeHhLmqKtGIMrGSKq7o2CI8W3/VjZttwEtexSew
 aGehUQ/8PRqDH/OY29g==
X-Proofpoint-ORIG-GUID: Utaf0sf6D-zrcvlYUFxj-Shdg11sKjQk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfXx/a4MptZ+Cmf
 TeZ7kWVrFKS/ryVhy8UovPY8VhuRhPpcAO5rzB66fbXtqf67Yze4EKtM+cteb6nu+SEAHfltDOy
 JD6xvb0i/qNrbJqi+SyEn4JH1eOSeCg=
X-Proofpoint-GUID: Utaf0sf6D-zrcvlYUFxj-Shdg11sKjQk
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a688c73 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dSzjJuGR07uXsTsEdN8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280097

The intr_target_width field sets the mask width used when writing
target processor into interrupt config register and deciding which
processor receives summary interrupt for a given GPIO.

Without it, pinctrl driver defaults to a 3-bit mask. On Shikra, this
field is 4 bits wide, which could corrupt adjacent bits and mis-route
interrupts. Set intr_target_width = 4 to match the hardware.

Fixes: 9db68ec534c5 ("pinctrl: qcom: Add Shikra pinctrl driver")
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-shikra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
index 0fc98369948c..55aec2f675e6 100644
--- a/drivers/pinctrl/qcom/pinctrl-shikra.c
+++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
@@ -44,6 +44,7 @@
 		.intr_status_bit = 0,		\
 		.intr_wakeup_enable_bit = 7,	\
 		.intr_wakeup_present_bit = 6,	\
+		.intr_target_width = 4,		\
 		.intr_target_bit = 8,		\
 		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\

---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-shikra-pinctrl-intr-width-982cc47c24c1

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

