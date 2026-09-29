Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEB522EEA
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685138; cv=none; b=LLjlFTwhTXzE8HOXQxanZag6MgilYWI6ESLtKDqOsoRgHRJdGLG2x+bEv7kWznWjvmxMamBmB0FcIcIZGxRurbw275eoKDGvksi0NQhnxV4gmTQtXrIDGCX2ju+re24LAWcQO9EEogy6ba64cnoXH9I6HLz8ZpALnP8Fqov+680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685138; c=relaxed/simple;
	bh=PDMjPWm334ILqkH0j0QtEbKYahNrE9e0Ek8j2ioFSF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d59h9kYUXK3DlN+S3bBCxTOZG93pruBwjknukgUXTbUDrJ01dqCwjrh9wwmBwXaHHRaLJ8wVSFA0N+1QO4+iUu/0k1OiNABjqVXZQKSyd1yB3VbE44XvGIt30KHLRTlnqQTbzZfCiLY8aefb8snsZPPoVXzy2CNUBF4++7Kvz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbDvIdY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFtrFYVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbDvIdY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFtrFYVM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCENSr119176
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dh0ySh1o/SczIrBHoeAsFT
	7MjCXtjUmy7kNVxoIvt5E=; b=jbDvIdY06qkndVhy/+b7qUqghu+ithgCC76fu4
	HC+OKijtXsOyxSy2+O4Sz9/ZuUwnriflxfPe04WCyd2Xm9BM3VdQngDf1lnVtamU
	1w3Ck3wAPDcExDVVAkYbjjrZVfDeteb9pey0s/SU0Qjoyj0Uevl8YeNaHSxKyYej
	vXNoPP7y5EqHC3LOBfAm68unVF9o0tA/oBw7U4WiZW8OfojO+H3YY/zB+xCNYbGu
	9wYacwc36UzUAIaLk3+MjEr+PJxMuYSEfNlcsUZYEKzt2GaBnyIYi5WtRxTBI0X1
	MZWQ8cf59pEmbwPQiE+wbr1BGIUnAX3eL3JZ9n9Sns0a+R1A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144txd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:32:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b731e00834so1704804137.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685135; x=1791289935; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dh0ySh1o/SczIrBHoeAsFT7MjCXtjUmy7kNVxoIvt5E=;
        b=aFtrFYVMls2JnOP+PTP0hEddkfLAi++/EtUbhLupcnarAm274H417uNRNsauBYiaGw
         7YchlCbUct7Ho0Idj8SXhA4vajT4oh0mAzr9XPRYU+qZmkAV1meiEVoA5SU9fez0x1H1
         GChRLMqWQ5bje/2We2ByCgqVDatjegwvnBUSztkNdwmVfBRJSFZchCYUuRPwf/Tx+cBp
         LVfoycY3dEhqJeD3ur0XBfYMBb737RPLBPGCwQcys5cWc/XBN9gNLY4lUbSlHYXff7CC
         lPzRkSP+YwFgPqS1YCZu8H/va5Kus5uMRSvgpZteClqk8Y/mmendpCTihLEntZwgIEej
         Gd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685135; x=1791289935;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dh0ySh1o/SczIrBHoeAsFT7MjCXtjUmy7kNVxoIvt5E=;
        b=zlXkzDxgYGmt3srnWRxqZlkyWTUIQFWu4zSzTYPqNAfkWKtENTo0qzhlt98gHMPsMb
         VZs3rq+OMn+i9SfMNmI46O572cInyMecxoQ+FgDDBZQphui91YVgGTrLBHOND38wZFxx
         9wp8c4ZKalO95Mimt4AoNCmoi/uRqoiJqkrXSbHkCf7bfwQoIFjHif6HpKt1mXuzJk8e
         hZTKHYZrGEPMOhwb5t0fl1gCD9XG4v9OZTusS+DR7B9MN9BGKkmnbP7/B7yLf/2RVuER
         BsyTJobjZHoJG9z6xT5EtgX9po9SgyIF2Ic8xz8BsEPxJN8QhjbPJhTkapbaiJaetWV1
         uxxw==
X-Forwarded-Encrypted: i=1; AKwUvBx8r9n80CwicKXvPJAq9w1ujEUggngnvRdTP7T0D/tmj2Pvxwf2GI8MUEYm9dRVpAkiOYtM2gppwOST@vger.kernel.org
X-Gm-Message-State: AFq9FYKJv4FggJHSQosI5hg+bYxLqyg1N2w3iKm8gkkFgjPOpgU2oH8B
	/DJ3cIRrlhvJOzrPcFrNT1n2uDUk8prOoSqL87o4U6ya3tblP01eJDbvLL4TSc1TF/bsAOIKBaG
	TbFWNWqiXfgagR/8yvUYfZo7zSyOrIQl44YeZCVTr0mG9hz0TFj+AFrq98g9fZDrj
X-Gm-Gg: AYBFou15spoTEOXrp5TlVMR3v6KT0YEC631fqfa8hYK9DTWdKhTaoFPid0+5YpyHDP1
	XP3yilV5kS+ArdPHGFVxik2thXgtkbuRYjmsYnb7QypQfoc+2pY2j4S8s/xU+iF0cx57a1YUCPe
	U5odK0KITTAhU9qL6YjzJ5QA0ghbeRzIAtipkC5glS1kSdxuOAcIxz8Y42unJpOFLGpi/pmzPFA
	GikXSRBNwOigA95SbmMsSFIBmKOdMhandminBmzC+BS4HVz6691GOJeTSlU0L5/nKflsJi8QROO
	WZSjkqckmLsTrXmOvY0K27GPzB9XY8zPNpcjQH23h/HWtNdIyPa2LGU9Vm5OL0qy9A5Ih86ZQFw
	F/W5c0QlRqhDCspPxZ9tjvZdkKLskGw==
X-Received: by 2002:a05:6102:14a4:b0:7b4:7086:876c with SMTP id ada2fe7eead31-7b47086b47fmr2201386137.23.1790685135051;
        Tue, 29 Sep 2026 05:32:15 -0700 (PDT)
X-Received: by 2002:a05:6102:14a4:b0:7b4:7086:876c with SMTP id ada2fe7eead31-7b47086b47fmr2201375137.23.1790685134582;
        Tue, 29 Sep 2026 05:32:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:12a5:a874:db1a:dab9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea7c0sm79190355e9.11.2026.09.29.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:32:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] gpio: shared: fix no-device, fwnode-based lookup
Date: Tue, 29 Sep 2026 14:32:02 +0200
Message-Id: <20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMKvu2oC/x3MQQqDMBBG4avIrDtgA4bqVaSL2PzRQcmEhGpBv
 Luhy2/x3kkFWVBoaE7K2KWIxorno6HP4uIMFl9NpjW27U3PcxLlsrgMz+GI6sGb6vpNjJe1wWH
 qJg+qfcoI8vu/x/d13WuCChxrAAAA
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PDMjPWm334ILqkH0j0QtEbKYahNrE9e0Ek8j2ioFSF4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqu6/Ft8QFZACk3CZ8XbO5PJuonfQpc29La0O2x
 pswTWsKl22JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaruvxQAKCRAFnS7L/zaE
 w5fPD/900UoBzZKniOoHXnli2V+IyYkhpczzH8HHOHLAFE03ANAncMlwRN1fEfre2MVaeyJh412
 K+idPru8sUHy4rYWrsdY377m74hC8I4Jhoxuv2lou95FRwcEu0pIW8xiBnQmvCnOnhWzNC1THbr
 4ZZ1YFjljiCnvSW0s1zidlqj1pnhJgBhxRHzv0/E0fl4EdQp7YD0hp2bgGm+ttxR3gI+gp9zf/e
 Yd3aA+Jx4yq6vkCb5ltB3JzYYNlrIzg2Zrz6Ru34sH9EDkGNxjFQrF2/fJfdUyH+25aDXQ9FJca
 GVuOWOElPBz5pChQOw/T7MCQrw0vWswTS+q3reofo11Fs8ju4X/rBeBFBPfFW79PI3mx8kP88OM
 rn2fayGgdGV0YDWQxh0NRIs13uOux2pNpGA9I1Fi3XZFW2VjqkZsLA2+jSSQLzf1GdvilF+KNwj
 m0fMW+1M/z1dz95v+MZU9HN2WWufea/6CdqB1GP9i2v93uyWlzW81T1yS2Azhqb9buoLaJ6XQhp
 Yfc1DeHqo6aDF/2yPgjnlWDRYoq5L+7lx9DIARujK09enLdmmCfcSEd7TTos0h0gqExceE33qme
 xjhhA660buWAKpDdUitofOm2ImS0aq4BgVV0msSKU+vn8oMrG6S1Rocs/NxsOT1X+UWEPRc+sWi
 3hwEq1IGSSwX2zA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXycK7E6P3n5Yz
 pt+jm8reG4mOCcJX7Lp0Aecz+twbTIdG3kPU/ej2cMhnCtskYkh/57SsWbzdJQX+Vg/dwDf0pSS
 jWNgiZpAcVWHHZlSsUjrcBnyuQq9lQqk4nwvhZVymFSMTUYGHH7zyE4JzrHTDA02KFEY++Kbclp
 tIXY86gpLzMKXjgnxS8xnDSUMgz5++KpW3vTrScKU3YPwXySzz3IWzu+qiSJ3k4STbRZjSjIxYt
 E6NKXeJXly8/0kgzelQLm1fHCc7fBBmvhWz9i6Sig4B2bNAMphmP3UsEUi96x9x0KAIlo3J6a/U
 g5ialnakS2MT7eysAvy5xDK7x+z9vUuDWf41qbl53bCzu7BM0Jd1NaoBdkN8w6ccD+x+GAk7TrF
 8Gf64N1k/18c/cMguaRu88Olx8j55if7/RyH80in6wK2IqUylwJNaNZR+Ut1dMtnf2gh4266Wcu
 S45auZDENVAkrpjn3pA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbafcf cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vz7aVV0jI-s6JskwHMIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: _OSjuhTv7x2tXkeKFr1Ey_zPL9DlQ8I5
X-Proofpoint-GUID: _OSjuhTv7x2tXkeKFr1Ey_zPL9DlQ8I5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX+BEFj+j9GkIX
 4NDF6XnL/eqYcX3WueiKsCUaqOaJgANY0UzqjMscL1DDYMsqtfvdiFiKepymo5JiMVAZ1MYeMs8
 cp21aJKl+bhZhrtpMi3eEnKtTdvGfu4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. The second patch fixes the issue, the first fixes another
problem the clanker found during review.

Tested that the issue no longer happens and that sharing of GPIOs still
works on Qualcomm Eliza.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: fix no-device, fwnode-based lookup

 drivers/gpio/gpiolib-shared.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

