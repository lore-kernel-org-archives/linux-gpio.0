Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290962;
	b=19+qHJxUU2/oTiKvLRKZwd0A9QgmWnc379CLEyusJR2S2auQXXLO7YkqKdAFWZb4VTvT
	 bJcO7UQhoYT+miVXT8ZCTwRp5seDXTiKxoRGCQutUxNwkJTAcymHznF/FkQ01JXVsR1gN
	 lOnJPXH/tosOtcAMfJBTOlsHPUdIjFlEN4GKeQwR5EHhzhNUhYvayMC/JdLy+garzJZgw
	 TWCr6OOng6YP2QDxShlGm7d5rW7/lcjIwIPfx8NWKllSznt0XJzkwBdWnZFWddBpT7Gkz
	 L7BYgtR3x1z2Vl45p/sWI1bVm71OQPCLoqflLbIVXt0pyegWQUzWY9kQSYV2ea9/Tbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290962;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+sgSz8rjhpE98nh4N692/qFSxmEaoFticjuzBspWD5g=;
	b=Ti5HqpxPmgzR04wPQJc60V3jqq3Fpt1oaH4wfs/ByiqHxSZ6Yg5El39NpSDZcKftwbVj
	 Gt4A4LuSUrwOIOLFr50tFGLhxqkMNZ73FZ2n39t0D5dY61L5ZevSmyhAJM3xXQRTIwdb8
	 OJQWADuMOuqiML9zsBF35y7FbGNu3G31k7N/Ccr4GrdjsWIR2PPTHSNez5jxzH3wWTayR
	 WM2rvig4FYxnOgKPQM8DzoVBvLr9dqQciQ2ac6ubfRPnN7HtQklIw04cl1w9V0AXSwvBS
	 fdv8+9h157oeCwkq4fJQQ2xh5fcRcgcBobRh7RcyFqZgjoo3ZsPqXpAjHTZHgJVkcmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKdk5FRP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i6uJEYM5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA115606A31F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA115606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKdk5FRP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i6uJEYM5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDWhq3234237
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+sgSz8rjhpE98nh4N692/q
	FSxmEaoFticjuzBspWD5g=; b=dKdk5FRPUM3Qnm1pq4ic5Ks03eIrMfmPWPKSdK
	XA/nQ2GGjuYUDkLs4rpmYElUMRAhr3FR9E1Xb9z5sCFVw+ZSAZQHP78DlKpPuqfg
	lZ2UyrO9J0yXjziIgDrRKfD8y8fJsRHpwexWQfqx30emXIu5+QljNqqwwhlyF1Rr
	7mJG77iVh7nTF7g5ZH7SBXulrrMjF4peV+06zUcH+uFQwmHs9d/qL64ADpgx80ED
	3d8dQS/N3nv6NpjH1mxF+kFwbjEg3Yo7ZeQWqaxlcXRTaTN33HuuREcrCicnACFt
	2oqD8RZCgvLZ3vQqCRSsTjJx6UiZ821ses9vHe+Kb7dg0TDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b1tt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 16:22:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91becce058aso47296016d6.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290960; x=1793895760; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+sgSz8rjhpE98nh4N692/qFSxmEaoFticjuzBspWD5g=;
        b=i6uJEYM5NPMoXBalYEyTElQPNBRdKYJqZLpRG3rysDvSwNYy/sPFBw7hA8FFhXSGZH
         yhR/+icPN8qiMbq7HtLtV62TfRU9GnotwBHZQGS9czV4HHNyf3yRTArbTdVhUk2XQIBY
         ev/hr04t2C+Y28HfArjdJPxZ+YJZyrnT5uVF3v34BlPe5Z1VhwkWkyd2VH1eVI8q1I7q
         1Mk19TAwMUNPYHr7JF2ifurKj5gDqr1XDmmm5baciO6LGVC4u/CbtRIHeqeS6EwAj+Po
         5PT8ipMG5oVhadMgpA5W2uOkKaGtzPS6U2ySFSaK4n1vIr44yOGrfKduluiIQ/qJDINp
         ZmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290960; x=1793895760;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+sgSz8rjhpE98nh4N692/qFSxmEaoFticjuzBspWD5g=;
        b=DGkWRpJw7dDAP/tX109dzKP3LKzulpXwQKfWIa6NJKgz49I6iOMLTg9UFGPivHOayp
         ZcbYvjz+ZwXnCGvvLweOUfl9vGkhAae+0Pk4FivCQQo9qxcjZJNX2RbuBAVQDhT1Yg0G
         X+jgMDnq0BYxA/2nPcmTIhlcE4vp4CDPEzad7RKN6oQmTF1JwkhxXfYo9KdXvtxTXPs+
         kaNu8vLL8d5quAUwT1abz18wFQO+aG5DQ730vLtvLxiorpzrSdN92d4pwxG5dFXW/riv
         fO5YFsWXQfyu1bBtbS4O3B+Hflwgxl5aJKjXWFBLn2XJbmES06n/gBq6GG1f/PcyGZis
         /4lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa+UOXb65h+0YyrOhJVW+hnJzuRWnHf3/LKbYe+cDIhDHwElqh+YT56K4bJGNBQsq5Pv6iqoDIKav7@vger.kernel.org
X-Gm-Message-State: AFq9FYLqKXubFyykqQZMoTWXCF1qFKs74aVjVbjj9ZY6Lz5DrALdJXBC
	LJK6FSYKGuGgnPuOgzjRx7lg/Clplu/RFNUsvmlrSQ0+F4S+Vp4VBiGr/04pGt/VH9zFa3ivG5z
	TgjX5E0EEvElvu2B1w2iCoTBuOYltKS7vTFCvi6TNJe+oAPuuDIxgG6OmnW56itWq
X-Gm-Gg: AYBFou1gLYqyyuBnWpu0NpSe68zgwbrltFDVcSaP4AcTMQ7sB2Yi0i7VtZZoHrGjDYd
	6jwudzB4eqzZPXqr3xVOSwQ2DwLjuq4tv4CXRenDzeIHSogbr7bywF35jzV4Qgxr1S8K8Pvx0AT
	DxeQNrqe5v9LXp5RmDJq/oV1unB4FOHpWsJP+6ZjX9L7H2IOj5r7H2jPjUtxF5EBiN0UD0wb7Ie
	W6KJNHnjqStlyf7deK8E9DgxFDoTi4UW0I3441/CXKJ42WOaIoJ/OWuetdmruLfB1GLAYo3mayo
	KLKPboNtLNPYis0mvcaTas1GuuzDHJcVOm0EHA6A0EZKRQCsYKTdMPqBGQkiY4qQ27EBQZqO9nF
	A1QjYFj92R34rJI+xhgYe9NRXIhVN095zTfUiVRTcX59amfZpWg7t+8mHnWrK4F0B7c3dl04CYD
	K5YA==
X-Received: by 2002:a05:620a:44d0:b0:93f:5ac:14a2 with SMTP id af79cd13be357-94408d866d0mr835086785a.74.1793290959714;
        Thu, 29 Oct 2026 09:22:39 -0700 (PDT)
X-Received: by 2002:a05:620a:44d0:b0:93f:5ac:14a2 with SMTP id af79cd13be357-94408d866d0mr835082985a.74.1793290959240;
        Thu, 29 Oct 2026 09:22:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Thu, 29 Oct 2026 17:22:31 +0100
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMdy42oC/43QzU7DMAwH8FeZciZTvpPuxHsgDmnsbBFbUxpWQ
 FPfnWwH1AONuFj6W/LPsm+k4JSwkMPuRiacU0l5qME97Ug4+eGINEHNRDBhWCc6ehxTpuXkJwQ
 aP4cMSM85v11His6Y6LHXPSCp8+OEMX097JfXmk+pfOTp+7Fq5vfuf9SZU0a1Ba0c54DcP+dS9
 u9Xfw75ctnXQu74LH5BzhhvgaKCnVfMOG65DGEDlCuQyxYoK6i0loF7C47FDVCtQdUCVQWF0NK
 DUTqC2QD1ChSsBeoKRuUFxMB0B3YDNGuw+UNTQeNjPRcxgtAboF2DrgXaCvrQKy17E3v4C1yW5
 QcF3eACrwIAAA==
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3106;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PRnF/xyvAcn9/nVV44WBU4N/f+GpHAgidmZzdJ9UeHQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMN1nOO70bVVNkEiEhzpnUxG9sbAYz3ZktF
 +FbAGfe4zGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w8JnD/9co9yHbeY/TvPgWqYTfPEbFkAIzLmQEcN7k/OP4bUO7Pju/jdBhi+CDuCH97KjLDlDvbF
 eAekKH6aBc2z8pWF0Wf2wOLXgyxDAXD8fTX8kcmKZRm13qn6IhzZ+RoJVsMDpkr69o0WORhjEKb
 sEOxmuMDFrWEvGshlp/ijNbbEBDM/rCnAc86Y8ZsH2Y1PbQA22OblOFAlquGE06prlCQH1KDFrL
 VUEZLdfEI+phZgA7F9/Dl0jRevBPyDGsJ/2Ky0Sbq3U2STig3JCSdQW+zPWnmM88dxBb5XkAHAF
 jwljdqSWMe4lKj9h+hbgR25XfWVzy0p3mdeAYgo8e5UQjqZit4V9rq3/NTEqceEqLF4yisUYl/y
 3lkyBNGeKmZk0FbyvKVrOzWJ8fAvHdhcQcsREa1Mh4nWCXCq/GbpcdwgA42ogoP70Ysqb/vgpXX
 3vHe16gGoA1Tp6lBqz7v75II1p9i2v2099+q0tMZV4V8pYYDNTtiHsFAc6IH6uf0CZt8/9JefFq
 EtVxlNie16CLc59Kqa0U4hpXzLRoyWDkcc2M12ypA+ep2t0NMaCQDIPYI2zvCJ5p9oH55sIu9V7
 6sDDWgl0NnCK+IiKQm79XctkgnC+h8GS3hIft0Qe2MEfBpazyMH7FcNPonE5ieRjzaMrnwAMf71
 CvOT3yiMRwieN7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX5qjz+XQ39Y8c
 f2PQVtpvE8X9GEK/Anlu33ibJuT/QmvM21x0ACrRH/4D7NvAFtaAGbPW75frK6gmKaAizOd50d2
 bQobcLwfMy0zKYv/SxjH23ntpZWUCV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXyc7D4u4Hd90f
 tFhBIbth1pCkUm/A6FRDymkH6Str/KfUOGHhDVwRf2rhEKBV92RJ1CO51t6uYoZUlPwIlGqnoOQ
 x4Alr1z0dnRfX2SUFhWkUQyeoBOaIu1+PgtXit+hCAZVzGoH5Le57mU1GW+8ZYuz4K7+3VUe7DM
 qEtjDwzKDtZinKmjX/1a+0u8ZvsvNLS7cnXx6iqbPikHl6tAd+2ryMzYCEkM6QG3eqxvk5bWvhU
 IHJ9a0G7QsBUPDFwaaIjUwDoJsXbCCH+6yN1bMumtTSXxnhCJLUmBYs7egdPsSm0nqIOxYP+hu2
 nKdydeeVe9RqNyOkpZB7v4fjY6hTOagnGb2eYAtIGGVmyArVRKGOrog58PMa0w6WjskN9Egif0c
 mSEoma85VbsAsa/+v0UrRAbs/YnIfL42sgGhcGWui0h9FsncqAM2T99YJdVwt5zA5MvlDEUGQNM
 qGI4HmR+uJ3VsuY+TaQ==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae372d1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=WbyNnuNk-BoyzxhrvrUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 5gDpcAnJyuxwaCw3xKJN7jDqGewqyoEw
X-Proofpoint-ORIG-GUID: 5gDpcAnJyuxwaCw3xKJN7jDqGewqyoEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v8:
- Move the auxiliary device infrastructure (including swnode struct)
  into a separate structure staying alive until the release of the
  device
- Link to v7: https://patch.msgid.link/20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com

Changes in v7:
- Fix race conditions in teardown path (sashiko)
- Don't allow passing a NULL fwnode to gpio_device_find_by_fwnode()
- Link to v6: https://patch.msgid.link/20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com

Changes in v6:
- Add patches fixing the error path in shared proxy setup (sashiko)
- Link to v5: https://patch.msgid.link/20261020-gpio-shared-fwnode-lookup-v5-0-f4a2dfc059d7@oss.qualcomm.com

Changes in v5:
- Drop fixes already applied upstream
- Check ref->proxy_dev for NULL before dereferencing it
- Assign ref->proxy_fwnode with the shared reference lock taken
- Don't return uninitialized ret from gpio_shared_make_proxy_dev()
- Simplify error handling in gpio_shared_make_proxy_dev()
- Link to v4: https://patch.msgid.link/20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com

Changes in v4:
- Fix arguments passed to ida_free() in error path
- Fix memory leak in error path
- Link to v3: https://patch.msgid.link/20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com

Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpio: shared: factor out per-entry teardown helper
      gpio: shared: factor out per-entry setup helper
      gpio: shared: unwind partial failures in gpiochip_setup_shared()
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 321 +++++++++++++++++++++++++-----------------
 drivers/gpio/gpiolib-shared.h |  15 +-
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 202 insertions(+), 154 deletions(-)
---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

