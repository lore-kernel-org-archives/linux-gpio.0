Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284424F55DD
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970726; cv=none; b=R7/V0AlOkuXb+LTNMpyDeJFQDg5l/OdVnYEtP3ScoJ1VZxNpAAcRU1Da5pCMPSyLp6DalHD2pNFfhwYLE+ApLd2tp1f9u3mEcFTUgPFWKmQImGB/wwGo0i9iv1BNXTxOJBrwcKqf50SwPVoUqdtZOTzCuINBx0nYf+nFaw3go2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970726; c=relaxed/simple;
	bh=qCBTQd9mcKs1pd9vFGX7TdmMZr2BgcsJVLVb5TDkhPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qqr9+Aj0f0mkE9j8TbDqreZ/nxT+tvqzaWxPKz73IKzk4cZdklqdHoqHP9duERlrPMNgPI2y692PrhTnnFK0wERQs++w661AVl7pqDFXgT+GPwEY7sb1qHQtqQej2uTm+O5ML9enHM8qaRI4yqhS3uGuyAfOnL/hmceqUH/OHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dg7SCIXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOBq7mAM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dg7SCIXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOBq7mAM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7uhcW1592414
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0r+WgG+FugCtGlGyq69Kpa
	nVfE1+t7xq9XvywIu+4wI=; b=dg7SCIXYrIpGlFbPg+4MdNADNdKXFePblK9WZe
	ySruMphwkYTQVivIfx4/gLzKb/JH0N1r4qsZ5euYX1bk/cq9kUT8BxiTzGWvjXlT
	rzHY0FsH/R9fx24Adbv59g7ciPIQ8q+pNiW0Hw9a5ZjRBLAtSY5TRbmGKxie05rI
	PlZp2RBzkc4iReu3Lto7ODLxZrqbh4tAIYVp0qJ6igrMC+eERcFowJhappOaPF7G
	sIYjPAZqChJGxSl9UTta/VPv3Ce5VAJk2g2P7PNY68qodTRE42JmB0+rPTvgWbUa
	OddspWJPqAoHlWSuI1u06xfmdSx9aFJinof7FXvOK0h1vHBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tkj8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:38:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1209556485a.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791970723; x=1792575523; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0r+WgG+FugCtGlGyq69KpanVfE1+t7xq9XvywIu+4wI=;
        b=QOBq7mAM7QckQaar1F4WFPg5FzfuEvaNN9Z7CZ9xqCS4C5LBVXG21XqbrZid8yNj4r
         HFLYvJGJMA7A5m76f3hlyvyNwuuq/d4aCq2MeJttrfJvqao6Lm60Zhh8STnGxZ7ewbGH
         23VSyQliQ8vkOHT7MWO454/5Mb50QDVMXmmjwC8oYsgWKo2mo2d1a4wsXF/V/zyo8qN3
         CErS3UhdsOUBtwsCEq+mrTeyhXmaGxg6t3jTg+vePDidxD9iqZo7Nh4a/E1b48aVIfb5
         0g0otEw5mo6aUGCnVk6zcicGniSdawRsg8cZlKCHji0648MJuDKMuiHxx9FABk6apUaT
         ckKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970723; x=1792575523;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0r+WgG+FugCtGlGyq69KpanVfE1+t7xq9XvywIu+4wI=;
        b=UIXmXyUXv97dbCXLQEttR3EzZ/NquBJTPWNydnrLMrgAeWNd5lXsOfbFZvyH1PFUEK
         iegonsB1JafhjULDdQw3vzlWhAG8cEbU2Dek6YQRpMWbosqi66kpKRvInMcKyT9YclnN
         u/4CA8XsjnXORGzJ1Fck7tDJzN5zCvW9q5nC+f48aHJhG3PS+2GOcX86vMTqDTFfLOel
         VuFSph9JB2XYzd4xg3LMs/ViHy3rDtGbYGQTJjKGwqkTdH1R5bsWtNRUD9JJ08Y3B63w
         vsNDOGV+QTR1DuNPzWSoWTLY6uN7yMPxWYgoxGA3cmSCUeb7iIRuiwFg2xIK7jyuxV11
         oHPg==
X-Forwarded-Encrypted: i=1; AKwUvBxYza6oJ7ORxekApL0v2/t2dJrn8v0pgkVCX+K+D2wpIoiu90Yn/Q4HEtkB6wQvZGfHKxN0OedG6B5J@vger.kernel.org
X-Gm-Message-State: AFq9FYIGV7qIz65BQZSu0VYpba6O7pr/tLuzDqDTRkZFeJUauo4agGBO
	1xhwQ/PE1QBifH6E9znyz1MSDzgJvoZ102ITOH0rSKgZL2zM0rCPevpyvr/VrPqaaRFLsUF45ku
	sOI+S8Vnv8Dnsojj1GG0dSYrEHdtNWmrygAADYJL5lET76t/7FpDpr4HNjFln574H
X-Gm-Gg: AYBFou0lrI/993ACs7P2anqBaOckIBsYMY5fqalljAqbwHubOCRUEZJIl619FHMp482
	J/w9VhU17KnVjJ/x7SpyySYADD05gMEP4/br70ujrARfCqCRix7y55rnRxWzqkInJQyCP5iitpw
	lQ93xudY5mwpB1G0CUtxX13iupvn9SDb0TuBAet4ogOnl1Y+BQilmSjYQmcpk0D7HaxAiETou2Z
	MVp9pfSWEFpqRxakTqGBq8/HMgc9sBdyAnK5GgXJeMRA91cvwd2Ezt6akZWWKj3MJwOiX3Qb1wv
	8VIIvgDeZwpVoO2iuTok9WvD4z3BjkNV7LnCosJ+HUVqcSXfK2vh9HsbnHT1LsoAPaVrfwC0poc
	+0nOzAx9imeuDJZDJ6ZMFKQVm6xO4
X-Received: by 2002:a05:620a:1b97:b0:93e:66e6:fa4 with SMTP id af79cd13be357-93ebd20e4a4mr2356930285a.16.1791970723245;
        Wed, 14 Oct 2026 02:38:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1b97:b0:93e:66e6:fa4 with SMTP id af79cd13be357-93ebd20e4a4mr2356926085a.16.1791970722338;
        Wed, 14 Oct 2026 02:38:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b9ea1csm19510655e9.3.2026.10.14.02.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:38:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/4] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Wed, 14 Oct 2026 11:38:24 +0200
Message-Id: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBNz2oC/43NSw7CIBCA4asY1tIwUPpw5T2MC4SpJbalglZN0
 7tLuzAu1LiZ5J9kvhlJQG8xkM1qJB4HG6zrYqTrFdG16o5IrYlNOOMZK3lJj711NNTKo6HVrXM
 GaePc6dpTLLKsUniQB4Mk3vceK3tf7N0+dm3DxfnH8mqAefuPOgBlVOZGpgWAQVBbF0JyvqpGu
 7ZN4iAzPvAXCIzBL5BHsFQpywrIQWj9BRRvIIhfoIhgKqXQoHJTsOoDOE3TE6z+FRVrAQAA
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qCBTQd9mcKs1pd9vFGX7TdmMZr2BgcsJVLVb5TDkhPo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz02WlGTAafDE/Hd7Zzuvt3X5mv7EMATmZibkc
 4v+3ijXDkCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9NlgAKCRAFnS7L/zaE
 w4lZEACp2oTgXVOfgW8CMsnZzQvAm+1sdIrXOX4dwfB+cXLez9ujBe7QoULvU3Odt9H0uyt50wZ
 la3y8WEGEi/moUzRKJXPmJ7u46jEdS+W1mrGnuxMAfo5GtKra7b/RpcL4ZPf5VFWHC4QrYpe/Yb
 +yi725oONaELBosORHN8odn7JJKE96tw3ZMu9LJOsCvbu9UjPF05sjBPJ50YBcF1wuOE+c4PzxB
 gDc9vP8pUe1Qpitlm9CVSYXNjqas7PABWXqcTz4jtNwzqsWcegFSumYm5244iTevZNi/U7p++TG
 AeYJu6JCOKx9HJ2n36vNJrXolBPCnzs6aDkuIQ/d7ImhHTmXPsuv1XCtboYwjkEKZ6s2r/ZfsPi
 R4SPix8930P4X7r4Z9nK6hNxHmoB82WLkkTYNkd+AcB9mxFtL0/xmy135PiI8sg0VY1YZ1/6g/m
 wqKWwftF+iO6VbL4scMXThC2ZbyqxTHpI5MlrWM+wIY6cLd13kpNB2a7q08tmGA+Hi/3qZEPYF+
 BDleM3vk5v3HmnJ9xIxKE7FDyFGnX+0WRFPgBEkmP72QCTV5nqdDYfxMpHIuOSim771awIEIX1p
 myp0tGqjGfQgWikIVXLRc9pXDMcVqZUyi/0yCmMtxXWdGrJ6xLjbWOIBfXRvIvkP8uGs7el8Qtn
 UAmss3ydmZsJDtg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf4da3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=cYHgvgXoKsdrWYhR6y0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX9YmtQDg0jx1O
 8JZuSfA3xnClEQ2CICRFazp+7G0jSLnA2ESPI7aHdDO59R3L5wS0sbwhHPWYVf9YZKeFArdKI4g
 4oYNwv9oGawurl6mEWZbK5XgQ9U1YC01ZsjjKGk8beTFGEKz6qlK0bnk/lNlWSggNGlVIxv6tVQ
 GqWOusbtafIuSrcqsCqeAfwghbofMH949OM7TthuP1CmtrnFcWgV1ia3hHfqc5UbYpJ9if8Og+v
 YExftB4vUXmh9UDpODhPIQ5mQIk3Yz+gzUBKRaUEnpmgl6fpP1kVoFDJz2jtxCGJ1H0wBMOeqYd
 +yKqIq4t39QRea1FVeSEiTvApgpyQbd+ZJDlI8DMFk5qtkzWtrZNoZ6xO9+z/7Za2Cubo4q0T+N
 C1hE02daVmYAEVfBMTLp/BdmPFxrt/rztJ9w9/2BHZqLAHfKYgQUXB6I6SquMcl7LnghDHNZ/kZ
 yuiIiqqzjCc2FXHWzsQ==
X-Proofpoint-ORIG-GUID: HVKwTzJE6J0_9a98-_hq0388AochMcgG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfXw5a4NmQ9CgW0
 lPEpVM9KZrPk4AZ37wC9gy3KfqQTEdVl4HXDhDP4RUG+9PCzWe5bVc+LnyvSZ0Fs/Nf8FaWL2jy
 Z6CJ995lpqInzCt4yBNK3l2YNmMK8Ek=
X-Proofpoint-GUID: HVKwTzJE6J0_9a98-_hq0388AochMcgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140038

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. In fact: we trigger a NULL-pointer deference.

Making it work requires a more serious rework. This is what patch 4/4
does with 3/4 introducing a preparatory improvement.

The second patch fixes the NULL-pointer dereference in favor of
gracefully returning an error. The first patch fixes another problem the
clanker found during review.

Tested that the issue no longer happens and that fwnode-based sharing of
GPIOs  works on Qualcomm Eliza.

Patches 1-2 should go into v7.3 and stable. Patches 3-4 are v7.4
material.

Sashiko pointed out two more issues under v2 but they're false positives.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (4):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: gracefully handle no-device lookup of shared GPIOs
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 159 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h |  15 ++--
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 94 insertions(+), 100 deletions(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

