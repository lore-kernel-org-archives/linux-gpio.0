Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623830;
	b=RiB2E9YePMEPDsqkL6GuKjmhp8Q/hi5O9528OkZT7SodWve8RQeTaTAyKMCGKF+lGC/E
	 cyIkBo+uEE2R+W2BlaRxJr+7SgdrRQ+PWqiGoIubf6OSUp2vTTGM41aVgTHZewSPdzZFX
	 OXkZecNL4btnrlkVfgNE+yQ7RFtA6M/KWELOa/PGKAu4sy72sByiMo/oGhB84b/i8sQtF
	 7RFcb7dQX1vK4/bVRfqkti/wxWEUOhxNBwJbhMLaByudrMu3m7Kf6nWGpvkNdYgZHcGpL
	 InJCQeIgpOoO7nqn4xKJfFQOmmcjwsL5eMYklcCf+QyrbyAN+baGEYJ2XiqLsgufyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T7gylL4YQJXqO9A6+KrwBidlkvLGRKOU+3VgwMcz6YQ=;
	b=xKhgYxv4zU/Eva8p4c3Zm4BTKS/NAf/Z75XlDslMI4Uw+Z9EcZ32EaBI08Y71R/9vEDm
	 TUTN6h6QYFdeoMOmyr/6otx3J6EHxDJvaTZjYFCJMBxVotn07nIsUYXFft+ZY6ymJ/W/6
	 hciFoBpy0MmhIpcJcoHrQk18S4wsOru2E+oKodTk7pUwAmOlWgtTcOJdWiZ6dYKH59ms3
	 lw2d/8S+vEGm8EbRgaPGh5FQ+qDKRAyFcK2OVsGaX+aTT0b0IeF5pfMEEZx/FGwBotvIi
	 2ulL52ZlUKpWZDwcj2sd2z4nBMD2K/1M+iFI9+JFjVnyek2Ir1KyIPofSQK2w3aeOyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdtKpjuA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmTWTzBk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4784A606A338
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 12:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4784A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdtKpjuA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmTWTzBk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMNa1821213
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 12:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T7gylL4YQJXqO9A6+KrwBi
	dlkvLGRKOU+3VgwMcz6YQ=; b=GdtKpjuAhqH0ZzX4FwD1erBf/IDQI8OQn79+7y
	AhUWhWym/D/GJCY9oURE25pISxIszETnq0ltyPt15As5cT9S7LAx+eMBfUJrwrkn
	nnqsP9NEYB3w35+0NtD44UXeO/RpAWn92+oCYU4tXjY45v3ZMOg2Yl1ir9QlGV5M
	Jr/w5/HTSt+xVMgOX+JlXsjo+vKoB+C2/O/+pkqRqyIAOB82MA9sKl7lQYH8GxPB
	Djpwxw61LggMc6rnaEHnePzLr4EWfujzoTWUoD56mws9fsMs6lKFyQIWR3O5bese
	nIq4LFaxevFudsN7u+M27KBkQzfXPV3sOAjkGSGhXPJB5EkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hqja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 12:50:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso745012885a.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 04:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623827; x=1794228627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7gylL4YQJXqO9A6+KrwBidlkvLGRKOU+3VgwMcz6YQ=;
        b=VmTWTzBkOcTh68Y4N5wds0CTWP+WzcdgRWc4O+4m2wm5dg7vV2QwKEsPfDd294MJud
         L/DpgF71KIZmZEs2a9LrCoJ/bzK+58PF7YIx7Okhq6123WlicD2cKnOnS2MOooGF2jTE
         y1ccnd8JzqzKEU5qns+oJAIiuzHWp3kuy98dkK9Osr6+45tp5NIgKncFX8scKr8lUU+I
         NxMt6b5RwHCTG7vq8y6psZZd46952/cV6WQF4eKQqaUX+BnpwHdipEiY66bShq+UPyRU
         wnCazsv4RxHZznMxbLIZAX2CCzaZn3ymGXGfUSQy0Y6ml757+BKpIynuuLGWX+nCXfHX
         jemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623827; x=1794228627;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T7gylL4YQJXqO9A6+KrwBidlkvLGRKOU+3VgwMcz6YQ=;
        b=2aHwY8vLt4U28nusd66W/V9n29iQaxV5dnXyAmEM9XgbbKPb7TFI/aW+tNvDqZLMXc
         EU3D1J3S8V6ygUPcZRlBaXSn/zACLyk04YvgKA7zKmxV0ZfRs8Iqii6zLMCNpUvU/u2S
         +YBYXZ1/QMgGTB2rKk8WQCuQdeyubiRKxhC6Lw9sTEAi8Zg7M6H+1lwM9wMqZxpidmJL
         FddNDbGBlqPoTfvRsiJwLcVMLTrJrM9L32LHtEryrncehF6XNxupNCftFCKjWvjhogrs
         L9waUaHLAJzTTIOCPhR7NCRE0O/wXYNjxZz83FpGdvgmgFyI6hRqn5x+/c/aaXlMg2OW
         l8gA==
X-Forwarded-Encrypted: i=1; AKwUvBwev3qTRyrWrsiwpPBAfYk23BoB7M2l/mrlsctsxReLRYXilNHdlj0ZJZPjlGrHUYDoCxpMhcYOe8g1@vger.kernel.org
X-Gm-Message-State: AFq9FYLYYVGLYFJiusVg6e16JapxeVdViyYREDSmdNOkKpk1j4aFqT79
	fVLijRLy/cGzDLLRlWkQwlVREEh5v6Q73yJAMFp7v0eNH6k0rD6UfS5qjoO2QtSmCovM4Oy8ZeD
	VSPHk9fGV3OoG5NA+dr/RhNTdkH3mSbPKnVSA+L+OwpVzvQl//vjwI5TkqTKx7f5l
X-Gm-Gg: AYBFou2m3gRSGjgio5payRckkHxHKCqeN8f+8WkSy3QhZinmfvJ0TOUCSi6AUzvL+WI
	ImrIJEUOn3zueqBh6RaBG94wwOryCP/reyIG3Cgv3CebIPMnVPSciekUFoX3y2RIQuB6n/sMbDs
	UHPvfE+iDbYqwNDCd8lNpFwNT+uPxPcbGZhviwRYvI3zAT9GUCXi1QBzAeneu3Tk8Bs9CiUl7wz
	wD/mthqw6dw2bCfu7lwK6QdVCqXrcbkaT0iX/bTdQWmSWAs6mcQpNGQKKBPfnVGL3dOHBsMxHDr
	rGiF8QAuDKzJnFgKWaLPBL8pwMBZ50Zqc9vTUV8bMiZkzwewqeIr33bmLivqHPV52hsHsZX/Fe9
	Ze+aufeiyJQEHCo2xnXkslixD5MWoIUHU5GIl8ttcmbLwx0n0Tl4fMk3nyu9snYi7ph9ZQh7ImT
	cZDQ==
X-Received: by 2002:a05:620a:84ca:b0:93f:3834:31f9 with SMTP id af79cd13be357-94413358ca4mr1885096185a.12.1793623827266;
        Mon, 02 Nov 2026 04:50:27 -0800 (PST)
X-Received: by 2002:a05:620a:84ca:b0:93f:3834:31f9 with SMTP id af79cd13be357-94413358ca4mr1885093685a.12.1793623826802;
        Mon, 02 Nov 2026 04:50:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 0/5] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Mon, 02 Nov 2026 13:50:18 +0100
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAqH6GoC/43SzU4DIRAH8FcxnKXha4D15HsYDywDLbEtdbGrp
 um7O+3B7MElXkj+JPwmM8OFtTSV1NjTw4VNaS6t1COF4fGBxV04bhMvSJkpoawY1MC3p1J524U
 pIc+fx4qJ72t9O5948tbmkEYYMTF6f5pSLl93++WV8q60jzp930vN8nb7H3WWXHBwCMZLiUmG5
 9ra5v0c9rEeDhs62A2f1S8ohZA9UBE4BCOsl07qGFdAvQCl7oGaQAOgowwOvcgroFmCpgcaApU
 CHdAayGhXQFiASvRAIDCboDBHAQO6FdAuwe4MLYE2ZGo3pYwKVkC3BH0PdASGOBrQo80jroF+C
 Xa/jScQJaCDiGD/XMr1ev0Bm9blLAADAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3419;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UUuLPgEnFstgVMmZMlJ8YO2TLk+y/YhNCd0rzR1z1oo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcNN3oIEafD1+tsKzYLEKcKERGgHHc8vKCOw
 /uGgX4EI66JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHDQAKCRAFnS7L/zaE
 wxY0D/472lF8gP8o6dvefcopF0XzreLtjfoArTNgV+yz0CPUtSGd+jAEvBeL20gGpqJ5tmi/izE
 PesQL8kB/eosdJ5LvElEuapy1Vd15ssyNXYeS8VcuUGdJ94i/5yAC5CeZysGx0p1QDtdaHRgz8Y
 BfAivmghE/6KpJtFb8mNJg/xAhIyrWu/RbAE8lpUYqmx9G52tqZpd8/0zoNVeHzR9pY/kaEhFQZ
 kku2e2L5Tmj+SjCuOGPB9yBn82800lM1TeuQpEOjUb8EOC1cfeRIlY3Z2vbT5WkrmVa1fT72lSw
 IBPUllnXIiN36uhPGeyod9EViyGXb6Ju1ENFtgVbKM65OTiU7pX/OHm5RCwlZBuP7amAePJlTD7
 r6wYMC2wAcG313d9VNwbonbbVZorVbYBHqExp3Is9HtTUShlnjjrWg0hOXhKvKEtK8EEr7hTygw
 B2+P/kixdhakOM3NBXnhZSByquFQdkR52UWzOSoqwiXcVeItbTEoAcYkygkI+0ffT4pLu7k5jes
 3zn6W8ZHyuusCoFa576NQLCugwunumlMIyI/Tsj7lF0id63iz9qKtDEOjS2+NSTTOLlb9tmTc0F
 UDrdyauyFTM3qXr5jVXnxxxmB/8dbvOAjO07sncOXlCOsxgGw+yZmtwsb7h/8LJVePUyXF++zfY
 gDCt0KjvjrghYYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xVzu9W_PrR7qDmkwxSkf5q5wG-3cGSUi
X-Proofpoint-GUID: xVzu9W_PrR7qDmkwxSkf5q5wG-3cGSUi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX/ixMwruicyP+
 rg5dM9cCZsZohS4cuUuZRf54V+gVEpqOsb6mvhMu6avYSt1R8R7Do0jUi37F9G9GJOBWl9c8SkM
 nvNuLjRiXnXHHOWkz02n9Goaffs2f3I=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae88714 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=iV30hyYr1TxgaKsBA0sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfXyymaN858sn3s
 MNL7K3r1pRPuY+NRzgsNtNhShYgOHnxdh1+1UOIPFlOuIim6xKaQTHwY53CaOYYi5GuXfGDos34
 vUQ74FTysaEUdSoohPSoVh9nyJ/UC9C1cXw2wRqWAXI/KjwuRcwwVU7CUeQJETQvopXLKU9csKR
 CMgedIh6r+YYw1+aPthZZjNkpWKHC7UmvcD73PYFCwVhQFwwJYf3wBwlK7GsOkHv68HyiJ0AH5r
 bCD3nQ6rSIVjI9KR2+NhvuaioMN05h35nwPi2oiLbeB9OV8WSWw3CTlBHTNFPdsHOwlg6XSykuF
 o9+B34ojxSufKV+tBSSlV5pIXkoSqLySGV6l8AwQsF4q8UhkulErYiOMRWkY8yvW4mZ/maELs6+
 d1r+bAJHsvvcKlT40w48M6ngzZW8kKJj/mwVY8aGVmjaUsRndeePOWsuB01mND1zt77q1wCYADy
 uwNCNAZQcBpHzW254tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. With the NULL-pointer dereference now fixed, this is
a rework that implements support for this use-case.

Sashiko pointed out several issues under v4. Some of them were bogus and
I fixed the rest.

Tested on Eliza and made sure the fwnode-only lookup works correctly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v9:
- Fix software node life-time issues by using a managed software nodes
  for shared proxy devices
- Avoid mixing gotos and lock guards in the same function
- Fix a typo in comment
- Link to v8: https://patch.msgid.link/20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com

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

 drivers/gpio/gpiolib-shared.c | 302 ++++++++++++++++++++++++------------------
 drivers/gpio/gpiolib-shared.h |  15 +--
 drivers/gpio/gpiolib.c        |  20 +--
 3 files changed, 181 insertions(+), 156 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

