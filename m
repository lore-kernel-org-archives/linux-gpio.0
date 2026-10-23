Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749206;
	b=FOmAZ9gLSklLefRMTg3BIlUMTELKdnfZ328rGRLmv85B8F1SeEmFmoEShZdzBo6+EKz1
	 Y8PxY6YACdf6FY0A0Zc2w4vgkX8Ulk7KXFHcESmqO+TYgUeKOJUmZb2TJt2naqOr33HxL
	 PRGfl0R12IHSgHQyUqujV0lkm+E+wQNjouoAsUHV18wfliMU3ctimfkG1Wu3N0mETWat1
	 EhE/jUmYLFaWn6fCKkwzJ5xKHKvkXY28G4DnNU+paZRVS2uGjNI7YXAzfU/ROFKsPY8pJ
	 iYMehY5z7QXGhsYVauaVGftYWG3sdPgMU3IHvUFNYnArO+SwqmW8Rf24Fu573sLkKCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gBnG5sU+tJaFKPLImFYZENIYfRQYVEBnIoFPUn9xwEc=;
	b=EwfomxNRbnENumMdeaJiUV50ZAcb3rCrRWEstCxE4/LvcchuMv106OSPgGIheYK9hFiY
	 GhRXWsNhCLYzPXIge9PEtHlOWcNSENIVQwSOZVo+mcNvWUWtDKSkmMr0Hg4zehZ0Ns91V
	 3QvpEw/3tXI6Jx+4IWmuZebYfJBOw7EqXD3/wrW6EOomSTY7KSP/mT+p0hye+Eeip1nU8
	 lqut/xT1ib3NY/v2O4THRNGi/C8c0tWpcm0joynNEQVM7uTT4v01fncmmBmAg5owpTQoT
	 tbK9JU0poX0FnQrUipeIthVDKHVgLtuTw7pNQCw8Z0Kz95M0L/a67mIdXZMRxiLjBTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0gcWcrH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MK0ksp6J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D3606A31B
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 09:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 740D3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0gcWcrH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MK0ksp6J
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMB31048215
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gBnG5sU+tJaFKPLImFYZEN
	IYfRQYVEBnIoFPUn9xwEc=; b=D0gcWcrHCr+nA9If+gl3dcqNMUZKqEMIuREqeo
	g59lqJN7htaqTGEAVxRIC89yIvHjf5zfO/OfZZDwlbrNSys8laCKTot63mzCn1XQ
	6sHAeB3LvdyjUi5uUGMs5qCLrtII7ZiWMCnYieRAS+V5//zyymMXaiMsnQ2H+hiM
	75yNfOYLatpmkTnmXedrNKGfP4+6iIlI/GYtOHJNMgnVA89a5XZqn5EAD4g05juE
	B0ivBhqXo8YchiMeB8d6aJxJwX2lSzZzHcPYE8Bg4FSM/MnepVEj+23N8GEapsau
	Zw6SYGwodhYAZ9K0ECzw5hlo+FkdWL7dAIxi3FvvzFbV+NiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbk4sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 09:53:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so120161185a.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792749205; x=1793354005; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gBnG5sU+tJaFKPLImFYZENIYfRQYVEBnIoFPUn9xwEc=;
        b=MK0ksp6JoL2ufkstH2tGy8XORYau38huBMBppAGeV2OPxwHpKo3ZdXsaEhGRckHecj
         DO7uvY9wDrDHpoHTa4XIn7tlPaZ3fVvIzG9i47+HlW53DCnRJKuSo8egkMnXNhQ6NZw/
         onNOVAhcViEJGgq852p85pC/caPFT70+wspqp8R48YvgzCytM7ecJOdTjta0ve/kGYrB
         wpxCfKhtegApnueL5ZXlxLqUPQGNzSJBXC/+7M3Iif13BKBe+b25GHxd2P5dvFh+dpS6
         5CEjp/u8gpPKEEob1mfy2vN9JSnLHCG73+V3uNhIpxfL4rSfVvmNNa5M4IyJ25yfeBA+
         Ohrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749205; x=1793354005;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gBnG5sU+tJaFKPLImFYZENIYfRQYVEBnIoFPUn9xwEc=;
        b=JSzX/Uo+7ui8mi+f74oH0b4hoH7Ne18y6tCMsWMqi9TIeqUdZT7TW49AoqyAbK2ga8
         5yBH3JQzwjElSxnyyO6tSN/Swp2RFnWczeji/9n7SJUVsc/PNLbB9vGlvfHVyP6KIOT+
         qzNtdIos89TVUXGJHuaY141F6GIFLg/JE/W3Vjxunim4ZhcR9iLH/+rLJS+hmSkk2lI1
         xD2AgD2N0WDdVvigevTIGSttQdIxJr5CRf5s102pBbop6Q0QdGCVrxFzoO7hCGm5+ZPX
         9Svms/F/CU+4xg2Qefvdk7ofxw9XdPPJgfw1bU0mU+Q0EpQpMfKPBJMKAylv1+Y9u56Q
         EeNA==
X-Forwarded-Encrypted: i=1; AKwUvBzXAoNQJ3uoPE+QsXzSUFVpC/JLJHfbPsSg/ZI82sUXymnCWTw1r1o6FPI7BzgtSIxMz3AEFumS/Upc@vger.kernel.org
X-Gm-Message-State: AFq9FYJIdMt13UanZrO0suA/RifVM8mSFCmgcKy6ZULgaMpWwpxiQ4j4
	CnX5ExU0RO0yRA4uwVyPWZhrdZBVyTtKUGgYAyzKcfQi7F5MNnsy/ZfD8P7uDIaIJQQGI7iN195
	kWOa5lr4b0mxtz2vj4svRhiRN9j1piaz1pVlVbBGoUM6ujnMbwsGFJa2EcM2rSVvn9wWUbjsz
X-Gm-Gg: AYBFou1btEPmH0pCeYe42PtQuzWJXOC42Anno56TAopIaKc8yZx2nLTTn8n7VJPXYuQ
	ZXhubUNqM/Lq1NW3wJWFhj3Ixd2cF5Cwn8z63sQlt47jbJkYEa5FxfTUh8b4p7KE91/6FYuTvlT
	z1VBziOR/MKEyfQaTFUm0mte4xfjmiCMEAdSCyf6a4V3FnjcLfu0k5u++RJoza9zgtxVOpy2yIn
	6cRe8e9F8Q3G3yTz6WoDHWnxITMvbCzMa4ZSSYqWEbDMV9dKZpnyM05okXdYJ6EUM/3dDjYlPb1
	IaylQWQa8onvVQ9rXhMrfv0PoyXgxBlDHve8FABBoX6Xtz+ZKaLTFpGMy7/2GnWOog/l/c5Eiyu
	rBTM+rseBTmr6ovgnqPN8XRK12GBS
X-Received: by 2002:a05:620a:4443:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93f6f54b7bcmr304297485a.4.1792749204737;
        Fri, 23 Oct 2026 02:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93f6f54b7bcmr304295885a.4.1792749204126;
        Fri, 23 Oct 2026 02:53:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm63057895e9.9.2026.10.23.02.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:53:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:53:16 +0200
Subject: [PATCH] gpio: kunit: add .kunitconfig
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
Message-Id: <20261023-gpio-kunitconfig-v1-1-0dde8d430f20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIsu22oC/x3MQQqAIBBA0avErBPGEQq6SrQoG20INLQikO6et
 HyL/wtkTsIZhqZA4luyxFCh2wbsNgfPStZqIKROIxnlD4lqv4KcNgYnXpHBBQk1suuhZkdiJ8+
 /HKf3/QDWuB+hYgAAAA==
X-Change-ID: 20261023-gpio-kunitconfig-230b02010ef7
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=726;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zjxLTlDB1bmGq/ndSdl5co6qUjXdqFMK2uUuWfMZJlI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2y6PcJBrvhGVu47PchKoX03yZiusUOp1xM6p/
 bAIq3UYKxqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsujwAKCRAFnS7L/zaE
 w0jNEACdTCfQPbDGWrsB3vrhrkBKS9tiXuCZkr3mTXAjdkxAeBniW9conXif1JxPt5nukNYbSsU
 pAfFM4XePrwmcJ4H1+ov+qk9reWYF1B6TsFjtNiwSO6rXCy413n7dP2fogY3EJTT07EaexLJFy0
 aIPQslI6OX3LZIHIqutmsYZerR4AURKuAEUomlkQvaekU35pvQTb5rlq2cnio/RJa5n5dYhbpfc
 MNlE8dyzqAt7dj9dHvBiLBPRHwDwSELh1iqu4lkHOlflr+VaJbtGR1+QmwJ3Wb6VIAhwtijFIPS
 HYMq1NkvrJ8i/ntR3xbsuDBu4GHBOcViv/ZMygKijUzNXisbkrVFkzArL+lDH2rupcrc1dSsjTk
 wi3d7JQHh/sCuaJNywRdKvlUKHc4UTue4AI7DVvvAuFH+erVST0nCscvG7ASN4UUT5r6Fa74P74
 WEzffKcbQgSrMHwtKuGDyKxZRlWtaG9t8SJUmzciQAT2t8EhPEv3bMXnNwqblI4+O81AUqfkZPh
 MvL4/YTthWGk5UbW5wZUlMNxt6GuyL3UF7o0RKPlJ/PbFQyyC5rn7Fo49quPjOuU+2i75Dr/zl4
 HQ4u9YzYW3PWcHJo3yT6l7aI5htkkNA9xmAvxOC+8VucrZeclXzpndrmkHXDUYvo2CpDc3FJmoc
 +Pg8Oa4UY4wMV2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX6WLR8IJL68Ww
 uqLoUuMwtn/i+YuEPe0fe8HIkuMa9ylYqM+HuWzPkuYA6MSxWfP1Bf89XafJFcNlSrsIngeEzHL
 TtXxJ5335z2B27DAQsilwbZWEcnYLA8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX0LvS5bD5f9DN
 7DYhMPwOBJSC1nogS5bmD1QzJmODC4hvy/bPJ31fmk1E4pw52f0Xc8LjV08jWlRW3Hzz+6phrdo
 X4jnjfrQuLvsjobBmyIxZ76gr/dh2imDwdnUmyAO8BiHfUxPB+rV7E1v0AGL068N5uzNea/rw7c
 6mx5sbg9k23CW32J9Br4Mwkacfg/YMkpcxa9IHax8EZMu+ySa0Rq/Le8DHmfsPnGLImQlMC4Y45
 YNNqIhFw8+QwaL1Q+4+n1F+Mr3+AUtc7KQru+HDl/40e+ZaW8vBYyn62rn3hadEVo0sHLvF16vl
 PLTw1cy/ZINXIdn+v/OALZMvyxprJRUMfAHvCyFLKGYZkzIYY9MzkX/WpE2y8n82ZqbPAYTJnwY
 WxyBku/QHFUw06U9Ulo2+GEguyygn20d+SFveLEBT/J66sgXrVnYcLbmqznmFxIHOzAAu5p+GKC
 Wne8BYZl2TDcRc2KEdg==
X-Proofpoint-ORIG-GUID: bNmSMfyf5kR-a8-D6VlLu1_7VUmBvQo6
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb2e95 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NeeZg8exDCvkGIFbdGoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bNmSMfyf5kR-a8-D6VlLu1_7VUmBvQo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Add the Kconfig fragment allowing to run GPIO kunit tests with kunit.py.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/.kunitconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/.kunitconfig b/drivers/gpio/.kunitconfig
new file mode 100644
index 0000000000000000000000000000000000000000..2855ce948b608425b121020478b506d9cb94b649
--- /dev/null
+++ b/drivers/gpio/.kunitconfig
@@ -0,0 +1,3 @@
+CONFIG_KUNIT=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_KUNIT=y

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-gpio-kunitconfig-230b02010ef7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

