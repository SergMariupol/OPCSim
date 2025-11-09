/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#if __has_include(<private/opcuaattributeoperand_p.h>)
#  include <private/opcuaattributeoperand_p.h>
#endif
#if __has_include(<private/opcuaconnection_p.h>)
#  include <private/opcuaconnection_p.h>
#endif
#if __has_include(<private/opcuadatachangefilter_p.h>)
#  include <private/opcuadatachangefilter_p.h>
#endif
#if __has_include(<private/opcuaelementoperand_p.h>)
#  include <private/opcuaelementoperand_p.h>
#endif
#if __has_include(<private/opcuaendpointdiscovery_p.h>)
#  include <private/opcuaendpointdiscovery_p.h>
#endif
#if __has_include(<private/opcuaeventfilter_p.h>)
#  include <private/opcuaeventfilter_p.h>
#endif
#if __has_include(<private/opcuafilterelement_p.h>)
#  include <private/opcuafilterelement_p.h>
#endif
#if __has_include(<private/opcuaforeign_p.h>)
#  include <private/opcuaforeign_p.h>
#endif
#if __has_include(<private/opcualiteraloperand_p.h>)
#  include <private/opcualiteraloperand_p.h>
#endif
#if __has_include(<private/opcuamethodargument_p.h>)
#  include <private/opcuamethodargument_p.h>
#endif
#if __has_include(<private/opcuamethodnode_p.h>)
#  include <private/opcuamethodnode_p.h>
#endif
#if __has_include(<private/opcuanode_p.h>)
#  include <private/opcuanode_p.h>
#endif
#if __has_include(<private/opcuanodeid_p.h>)
#  include <private/opcuanodeid_p.h>
#endif
#if __has_include(<private/opcuanodeidtype_p.h>)
#  include <private/opcuanodeidtype_p.h>
#endif
#if __has_include(<private/opcuareaditem_p.h>)
#  include <private/opcuareaditem_p.h>
#endif
#if __has_include(<private/opcuarelativenodeid_p.h>)
#  include <private/opcuarelativenodeid_p.h>
#endif
#if __has_include(<private/opcuarelativenodepath_p.h>)
#  include <private/opcuarelativenodepath_p.h>
#endif
#if __has_include(<private/opcuaserverdiscovery_p.h>)
#  include <private/opcuaserverdiscovery_p.h>
#endif
#if __has_include(<private/opcuasimpleattributeoperand_p.h>)
#  include <private/opcuasimpleattributeoperand_p.h>
#endif
#if __has_include(<private/opcuastatus_p.h>)
#  include <private/opcuastatus_p.h>
#endif
#if __has_include(<private/opcuavaluenode_p.h>)
#  include <private/opcuavaluenode_p.h>
#endif
#if __has_include(<private/opcuawriteitem_p.h>)
#  include <private/opcuawriteitem_p.h>
#endif


#if !defined(QT_STATIC)
#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT
#else
#define Q_QMLTYPE_EXPORT
#endif
Q_QMLTYPE_EXPORT void qml_register_types_QtOpcUa()
{
    qmlRegisterModule("QtOpcUa", 1, 0);
    qmlRegisterModule("QtOpcUa", 1, 254);
    qmlRegisterModule("QtOpcUa", 5, 0);
    qmlRegisterModule("QtOpcUa", 5, 254);
    qmlRegisterModule("QtOpcUa", 6, 0);
    QT_WARNING_PUSH QT_WARNING_DISABLE_DEPRECATED
    {
        Q_CONSTINIT static auto metaType = QQmlPrivate::metaTypeForNamespace(
            [](const QtPrivate::QMetaTypeInterface *) {return &QOpcUa::staticMetaObject;},
            "QOpcUa");
        QMetaType(&metaType).id();
    }
    qmlRegisterNamespaceAndRevisions(&QOpcUa::staticMetaObject, "QtOpcUa", 6, nullptr, &Constants::staticMetaObject, &QOpcUaUserTokenPolicy::staticMetaObject);
    QMetaType::fromType<QOpcUa::NodeClass>().id();
    QMetaType::fromType<QOpcUa::NodeAttribute>().id();
    QMetaType::fromType<QOpcUa::WriteMaskBit>().id();
    QMetaType::fromType<QOpcUa::AccessLevelBit>().id();
    QMetaType::fromType<QOpcUa::AccessLevelExBit>().id();
    QMetaType::fromType<QOpcUa::EventNotifierBit>().id();
    QMetaType::fromType<QOpcUa::TimestampsToReturn>().id();
    QMetaType::fromType<QOpcUa::ReferenceTypeId>().id();
    QMetaType::fromType<QOpcUa::Types>().id();
    QMetaType::fromType<QOpcUa::UaStatusCode>().id();
    QMetaType::fromType<QOpcUa::ErrorCategory>().id();
    QMetaType::fromType<QOpcUa::IsAbstract>().id();
    qmlRegisterTypesAndRevisions<OpcUaAttributeOperand>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaConnection>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaDataChangeFilter>("QtOpcUa", 6);
    QMetaType::fromType<OpcUaDataChangeFilter::DataChangeTrigger>().id();
    QMetaType::fromType<OpcUaDataChangeFilter::DeadbandType>().id();
    qmlRegisterTypesAndRevisions<OpcUaElementOperand>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaEndpointDiscovery>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaEventFilter>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaFilterElement>("QtOpcUa", 6);
    QMetaType::fromType<OpcUaFilterElement::FilterOperator>().id();
    qmlRegisterTypesAndRevisions<OpcUaLiteralOperand>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaMethodArgument>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaMethodNode>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaNode>("QtOpcUa", 6);
    QMetaType::fromType<OpcUaNode::Status>().id();
    qmlRegisterTypesAndRevisions<OpcUaNodeId>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaNodeIdType>("QtOpcUa", 6);
    QMetaType::fromType<OpcUaOperandBase *>().id();
    qmlRegisterTypesAndRevisions<OpcUaReadItemFactory>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaRelativeNodeId>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaRelativeNodePath>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaServerDiscovery>("QtOpcUa", 6);
    qmlRegisterAnonymousTypesAndRevisions<QAbstractItemModel>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaSimpleAttributeOperand>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaStatus>("QtOpcUa", 6);
    QMetaType::fromType<OpcUaStatus::Status>().id();
    qmlRegisterTypesAndRevisions<OpcUaValueNode>("QtOpcUa", 6);
    qmlRegisterTypesAndRevisions<OpcUaWriteItemFactory>("QtOpcUa", 6);
    QMetaType::fromType<OpcUaStatus>().id();
    qmlRegisterNamespaceAndRevisions(&OpcUaStatus::staticMetaObject, "QtOpcUa", 6, nullptr, &OpcuaStatusForeign::staticMetaObject, nullptr);
    QMetaType::fromType<OpcUaStatus::Status>().id();
    QMetaType::fromType<QOpcUaApplicationDescription>().id();
    qmlRegisterNamespaceAndRevisions(&QOpcUaApplicationDescription::staticMetaObject, "QtOpcUa", 6, nullptr, &QOpcUaApplicationDescriptionForeign::staticMetaObject, nullptr);
    QMetaType::fromType<QOpcUaApplicationDescription::ApplicationType>().id();
    QMetaType::fromType<QOpcUaUserTokenPolicy>().id();
    qmlRegisterNamespaceAndRevisions(&QOpcUaUserTokenPolicy::staticMetaObject, "QtOpcUa", 6, nullptr, &QOpcUaUserTokenPolicyForeign::staticMetaObject, nullptr);
    QMetaType::fromType<QOpcUaUserTokenPolicy::TokenType>().id();
    QMetaType::fromType<QStandardItemModel *>().id();
    QT_WARNING_POP
    qmlRegisterModule("QtOpcUa", 6, 9);
}

static const QQmlModuleRegistration qtOpcUaRegistration("QtOpcUa", qml_register_types_QtOpcUa);
